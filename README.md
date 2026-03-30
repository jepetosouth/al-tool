# AL-Tool — AI Assistant for Termux

An interactive AI assistant that runs directly in **Termux** (Android terminal) or any Linux terminal. Powered by [Groq](https://groq.com) (free tier) or any OpenAI-compatible API.

## Quick install (Termux)

```bash
pkg install curl -y
bash <(curl -fsSL https://raw.githubusercontent.com/jepetosouth/al-tool/main/install.sh)
```

## Manual install

```bash
pkg install curl jq -y
curl -fsSL https://raw.githubusercontent.com/jepetosouth/al-tool/main/ai-assistant.sh -o ai-assistant.sh
chmod +x ai-assistant.sh
bash ai-assistant.sh
```

## First run

On the first launch the setup wizard asks for:
1. **Provider** — Groq (default, free), OpenAI, or a custom endpoint
2. **API key** — get a free Groq key at <https://console.groq.com/keys>

Config is saved to `~/.config/ai-assistant/config` (mode 600).

## Usage

```
# Interactive mode
ai

# Single-shot question
ai "What is the difference between TCP and UDP?"
```

### In-session commands

| Command   | Description                    |
|-----------|--------------------------------|
| `/clear`  | Clear conversation history     |
| `/config` | Re-run the setup wizard        |
| `/model`  | Show the active model          |
| `/help`   | Show available commands        |
| `/quit`   | Exit                           |

## Requirements

| Package | Purpose          |
|---------|------------------|
| `curl`  | API calls        |
| `jq`    | JSON parsing     |

Both are installable with `pkg install curl jq -y`.

## Supported providers

| Provider | Default model     | Notes             |
|----------|-------------------|-------------------|
| Groq     | `llama3-8b-8192`  | Free tier, fast   |
| OpenAI   | `gpt-4o-mini`     | Paid              |
| Custom   | any               | OpenAI-compatible |

---

*Original project by [Jeanjj](https://github.com/jepetosouth) on [LiveCodes](https://livecodes.io).*