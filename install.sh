#!/bin/bash

# AL-Tool Installation Script
# For Termux, NetHunter, and standard Linux environments

set -e

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}╔═══════════════════════════════════════╗${NC}"
echo -e "${BLUE}║    AL-Tool Installation Script        ║${NC}"
echo -e "${BLUE}╚═══════════════════════════════════════╝${NC}"
echo ""

# Detect installation directory
INSTALL_DIR="$HOME/al-tool"
if [ -n "$PREFIX" ]; then
    # Termux environment
    INSTALL_DIR="$PREFIX/share/al-tool"
fi

echo -e "${YELLOW}[*]${NC} Installation directory: $INSTALL_DIR"

# Create installation directory
if [ -d "$INSTALL_DIR" ]; then
    echo -e "${YELLOW}[!]${NC} AL-Tool is already installed at $INSTALL_DIR"
    read -p "Do you want to reinstall? (y/n): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}[*]${NC} Installation cancelled"
        exit 0
    fi
    rm -rf "$INSTALL_DIR"
fi

echo -e "${YELLOW}[*]${NC} Creating installation directory..."
mkdir -p "$INSTALL_DIR"

# Download or copy al-tool.sh
echo -e "${YELLOW}[*]${NC} Installing AL-Tool script..."
if [ -f "al-tool.sh" ]; then
    # Installing from local copy
    cp al-tool.sh "$INSTALL_DIR/"
else
    # Download from GitHub
    echo -e "${YELLOW}[*]${NC} Downloading from GitHub..."
    if command -v curl >/dev/null 2>&1; then
        curl -sSL https://raw.githubusercontent.com/jepetosouth/al-tool/main/al-tool.sh -o "$INSTALL_DIR/al-tool.sh"
    elif command -v wget >/dev/null 2>&1; then
        wget -q https://raw.githubusercontent.com/jepetosouth/al-tool/main/al-tool.sh -O "$INSTALL_DIR/al-tool.sh"
    else
        echo -e "${RED}[!]${NC} Neither curl nor wget found. Please install one of them."
        exit 1
    fi
fi

# Make script executable
chmod +x "$INSTALL_DIR/al-tool.sh"

# Create symlink or add to PATH
if [ -n "$PREFIX" ]; then
    # Termux: create symlink in bin directory
    BIN_DIR="$PREFIX/bin"
    if [ -d "$BIN_DIR" ]; then
        echo -e "${YELLOW}[*]${NC} Creating symlink in $BIN_DIR..."
        ln -sf "$INSTALL_DIR/al-tool.sh" "$BIN_DIR/al-tool"
    fi
else
    # Standard Linux: try to create symlink in /usr/local/bin
    if [ -w "/usr/local/bin" ]; then
        echo -e "${YELLOW}[*]${NC} Creating symlink in /usr/local/bin..."
        ln -sf "$INSTALL_DIR/al-tool.sh" "/usr/local/bin/al-tool"
    elif [ -d "$HOME/.local/bin" ]; then
        echo -e "${YELLOW}[*]${NC} Creating symlink in $HOME/.local/bin..."
        mkdir -p "$HOME/.local/bin"
        ln -sf "$INSTALL_DIR/al-tool.sh" "$HOME/.local/bin/al-tool"
        
        # Add to PATH if not already there
        if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
            echo -e "${YELLOW}[*]${NC} Adding $HOME/.local/bin to PATH..."
            echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.bashrc"
            echo -e "${YELLOW}[*]${NC} Please run: source ~/.bashrc"
        fi
    fi
fi

echo ""
echo -e "${GREEN}╔═══════════════════════════════════════╗${NC}"
echo -e "${GREEN}║   Installation completed successfully!║${NC}"
echo -e "${GREEN}╚═══════════════════════════════════════╝${NC}"
echo ""
echo -e "${BLUE}Usage:${NC}"
echo "  Run: al-tool                 (interactive mode)"
echo "  Run: al-tool --setup         (auto setup)"
echo "  Run: al-tool --help          (show help)"
echo ""
echo -e "${YELLOW}Note:${NC} If the command 'al-tool' is not found, try:"
echo "  - Restart your terminal"
echo "  - Run: source ~/.bashrc"
echo "  - Or run directly: $INSTALL_DIR/al-tool.sh"
echo ""
