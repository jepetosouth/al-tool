#!/usr/bin/env bash
# Installer for AI Assistant in Termux
# Run: bash install.sh

set -e

GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
RESET='\033[0m'

REPO_URL="https://raw.githubusercontent.com/jepetosouth/al-tool/main/ai-assistant.sh"
INSTALL_DIR="${PREFIX:-/usr}/bin"
SCRIPT_NAME="ai"

info()    { echo -e "${CYAN}[*]${RESET} $*"; }
success() { echo -e "${GREEN}[+]${RESET} $*"; }
warn()    { echo -e "${YELLOW}[!]${RESET} $*"; }
die()     { echo -e "${RED}[-]${RESET} $*" >&2; exit 1; }

# ── detect environment ────────────────────────────────────────────────────────
if [[ -d "/data/data/com.termux" ]] || [[ -n "$PREFIX" && "$PREFIX" == *termux* ]]; then
    ENV="termux"
    INSTALL_DIR="${PREFIX}/bin"
    PKG_CMD="pkg"
elif [[ -f /etc/os-release ]] && grep -qi "kali\|nethunter" /etc/os-release 2>/dev/null; then
    ENV="nethunter"
    INSTALL_DIR="${HOME}/.local/bin"
    PKG_CMD="apt-get"
else
    ENV="linux"
    INSTALL_DIR="${HOME}/.local/bin"
    PKG_CMD="apt-get"
fi

info "Detected environment: ${ENV}"

# ── install dependencies ──────────────────────────────────────────────────────
info "Installing dependencies (curl, jq)..."
if [[ "$PKG_CMD" == "pkg" ]]; then
    pkg install -y curl jq
else
    mkdir -p "$INSTALL_DIR"
    if command -v sudo &>/dev/null; then
        sudo apt-get install -y curl jq
    else
        apt-get install -y curl jq || warn "Could not install packages; please install curl and jq manually (e.g. apt-get install curl jq)."
    fi
fi

# ── download script ───────────────────────────────────────────────────────────
mkdir -p "$INSTALL_DIR"
info "Downloading ai-assistant.sh..."
curl -fsSL "$REPO_URL" -o "${INSTALL_DIR}/${SCRIPT_NAME}"
chmod +x "${INSTALL_DIR}/${SCRIPT_NAME}"

# ── PATH hint ─────────────────────────────────────────────────────────────────
if [[ ":$PATH:" != *":${INSTALL_DIR}:"* ]]; then
    warn "${INSTALL_DIR} is not in PATH."
    SHELL_RC="${HOME}/.bashrc"
    [[ -f "${HOME}/.zshrc" ]] && SHELL_RC="${HOME}/.zshrc"
    echo "export PATH=\"${INSTALL_DIR}:\$PATH\"" >> "$SHELL_RC"
    warn "Added to ${SHELL_RC}. Run: source ${SHELL_RC}"
fi

success "Installed! Run: ${SCRIPT_NAME}"
info "On first run you will be prompted for your API key."
info "Get a free Groq key at: https://console.groq.com/keys"
