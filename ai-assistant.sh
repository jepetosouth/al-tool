#!/usr/bin/env bash
# AI Assistant for Termux
# Usage: bash ai-assistant.sh [question]

# ── colors ──────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# ── config file ─────────────────────────────────────────────────────────────
CONFIG_DIR="${HOME}/.config/ai-assistant"
CONFIG_FILE="${CONFIG_DIR}/config"

# Default values (overridden by config file)
AI_API_URL="https://api.groq.com/openai/v1/chat/completions"
AI_MODEL="llama3-8b-8192"
AI_API_KEY=""
HISTORY_FILE="${CONFIG_DIR}/history.json"
MAX_HISTORY=20

# ── helpers ──────────────────────────────────────────────────────────────────
info()    { echo -e "${CYAN}[*]${RESET} $*"; }
success() { echo -e "${GREEN}[+]${RESET} $*"; }
warn()    { echo -e "${YELLOW}[!]${RESET} $*"; }
error()   { echo -e "${RED}[-]${RESET} $*" >&2; }
die()     { error "$*"; exit 1; }

# ── dependency check ─────────────────────────────────────────────────────────
check_deps() {
    local missing=()
    for cmd in curl jq; do
        command -v "$cmd" &>/dev/null || missing+=("$cmd")
    done
    if [[ ${#missing[@]} -gt 0 ]]; then
        warn "Missing dependencies: ${missing[*]}"
        if command -v pkg &>/dev/null; then
            info "Installing with pkg..."
            pkg install -y "${missing[@]}" || die "Could not install dependencies."
        elif command -v apt-get &>/dev/null; then
            info "Installing with apt-get..."
            apt-get install -y "${missing[@]}" || die "Could not install dependencies."
        else
            die "Please install the following manually: ${missing[*]}"
        fi
    fi
}

# ── config setup ─────────────────────────────────────────────────────────────
load_config() {
    mkdir -p "$CONFIG_DIR"
    [[ -f "$CONFIG_FILE" ]] && source "$CONFIG_FILE"
}

setup_config() {
    echo -e "\n${BOLD}AI Assistant — First-time setup${RESET}\n"
    echo "Supported providers:"
    echo "  1) Groq  (free tier — https://console.groq.com/keys)"
    echo "  2) OpenAI (https://platform.openai.com/api-keys)"
    echo "  3) Custom OpenAI-compatible endpoint"
    echo
    read -rp "Choose provider [1-3, default=1]: " choice

    case "${choice:-1}" in
        2)
            AI_API_URL="https://api.openai.com/v1/chat/completions"
            AI_MODEL="gpt-4o-mini"
            ;;
        3)
            read -rp "API URL: " AI_API_URL
            read -rp "Model name: " AI_MODEL
            ;;
        *)
            AI_API_URL="https://api.groq.com/openai/v1/chat/completions"
            AI_MODEL="llama3-8b-8192"
            ;;
    esac

    read -rp "API Key: " AI_API_KEY
    [[ -z "$AI_API_KEY" ]] && die "API key is required."

    cat >"$CONFIG_FILE" <<EOF
AI_API_URL="${AI_API_URL}"
AI_MODEL="${AI_MODEL}"
AI_API_KEY="${AI_API_KEY}"
EOF
    chmod 600 "$CONFIG_FILE"
    success "Config saved to ${CONFIG_FILE}"
}

# ── history helpers ───────────────────────────────────────────────────────────
init_history() {
    if [[ ! -f "$HISTORY_FILE" ]]; then
        echo "[]" >"$HISTORY_FILE"
    fi
}

add_to_history() {
    local role="$1"
    local content="$2"
    local tmp
    tmp=$(mktemp)
    jq --arg role "$role" --arg content "$content" \
        '. + [{"role": $role, "content": $content}]' \
        "$HISTORY_FILE" >"$tmp" && mv "$tmp" "$HISTORY_FILE" || rm -f "$tmp"

    # Keep only the last MAX_HISTORY messages
    local count
    count=$(jq 'length' "$HISTORY_FILE")
    if [[ "$count" -gt "$MAX_HISTORY" ]]; then
        local trim
        tmp=$(mktemp)
        trim=$(( count - MAX_HISTORY ))
        jq --argjson trim "$trim" '.[$trim:]' "$HISTORY_FILE" >"$tmp" && mv "$tmp" "$HISTORY_FILE" || rm -f "$tmp"
    fi
}

clear_history() {
    echo "[]" >"$HISTORY_FILE"
    success "Conversation history cleared."
}

# ── API call ──────────────────────────────────────────────────────────────────
ask_ai() {
    local user_input="$1"

    add_to_history "user" "$user_input"

    local messages
    messages=$(jq -c '.' "$HISTORY_FILE")

    local payload
    payload=$(jq -n \
        --arg model "$AI_MODEL" \
        --argjson messages "$messages" \
        '{model: $model, messages: $messages, temperature: 0.7}')

    local response
    response=$(curl -s -X POST "$AI_API_URL" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer ${AI_API_KEY}" \
        -d "$payload")

    # Check for errors
    local tmp
    local err_msg
    err_msg=$(echo "$response" | jq -r '.error.message // empty' 2>/dev/null)
    if [[ -n "$err_msg" ]]; then
        error "API error: ${err_msg}"
        # Remove the last user message since the call failed
        tmp=$(mktemp)
        jq '.[:-1]' "$HISTORY_FILE" >"$tmp" && mv "$tmp" "$HISTORY_FILE" || rm -f "$tmp"
        return 1
    fi

    local reply
    reply=$(echo "$response" | jq -r '.choices[0].message.content // empty' 2>/dev/null)
    if [[ -z "$reply" ]]; then
        error "Empty response from API."
        tmp=$(mktemp)
        jq '.[:-1]' "$HISTORY_FILE" >"$tmp" && mv "$tmp" "$HISTORY_FILE" || rm -f "$tmp"
        return 1
    fi

    add_to_history "assistant" "$reply"
    echo -e "\n${GREEN}${BOLD}Assistant:${RESET}\n${reply}\n"
}

# ── banner ────────────────────────────────────────────────────────────────────
banner() {
    echo -e "${CYAN}${BOLD}"
    echo "  ___    _       _               _     _              _  "
    echo " / _ \  | |     | |    /\       | |   | |            | | "
    echo "| |_| | | |     | |   /  \   ___| |   | |  ___  ___ | | "
    echo "|  _  | | |     | |  / /\ \ / __| |   | | / _ \/ _ \| | "
    echo "| | | | | |____ | | / ____ \\__ \\ |___| || (_) | (_) | | "
    echo "|_| |_| |______||_|/_/    \_|___/\_____|_| \___/ \___/|_| "
    echo -e "${RESET}"
    echo -e "  ${YELLOW}AI Assistant for Termux${RESET}  |  model: ${CYAN}${AI_MODEL}${RESET}"
    echo -e "  Type ${BOLD}/help${RESET} for commands, ${BOLD}/quit${RESET} to exit\n"
}

# ── help ──────────────────────────────────────────────────────────────────────
show_help() {
    echo -e "${BOLD}Commands:${RESET}"
    echo "  /clear   Clear conversation history"
    echo "  /config  Re-run setup wizard"
    echo "  /model   Show current model"
    echo "  /help    Show this help"
    echo "  /quit    Exit"
    echo
}

# ── interactive mode ──────────────────────────────────────────────────────────
interactive_mode() {
    banner
    while true; do
        echo -ne "${BOLD}${YELLOW}You:${RESET} "
        read -r user_input

        [[ -z "$user_input" ]] && continue

        case "$user_input" in
            /quit|/exit|/q)
                echo -e "${CYAN}Goodbye!${RESET}"
                exit 0
                ;;
            /clear)
                clear_history
                ;;
            /config)
                setup_config
                load_config
                ;;
            /model)
                info "Current model: ${AI_MODEL}"
                ;;
            /help)
                show_help
                ;;
            *)
                ask_ai "$user_input"
                ;;
        esac
    done
}

# ── main ──────────────────────────────────────────────────────────────────────
main() {
    check_deps
    load_config

    if [[ -z "$AI_API_KEY" ]]; then
        setup_config
        load_config
    fi

    init_history

    if [[ $# -gt 0 ]]; then
        # Single-shot mode: question passed as argument(s)
        ask_ai "$*"
    else
        # Interactive REPL
        interactive_mode
    fi
}

main "$@"
