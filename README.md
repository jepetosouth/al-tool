# AL-Tool - Android/Termux Terminal Interface

A terminal interface tool designed for Android-based penetration testing environments, fully compatible with Termux and NetHunter.

## Features

- 🔧 **Multi-Environment Support**: Works on Termux, NetHunter, and standard Linux
- 📦 **Automatic Package Detection**: Detects and uses the correct package manager (pkg/apt/yum)
- ✅ **Dependency Management**: Checks and installs required dependencies automatically
- 🎯 **Interactive & CLI Modes**: Use interactive menu or command-line arguments
- 🎨 **User-Friendly Interface**: Color-coded output and clear progress indicators
- 🔒 **Safe Installation**: Handles existing installations and provides rollback options

## Quick Start

### Installation

#### Method 1: One-line Install (Recommended)
```bash
curl -sSL https://raw.githubusercontent.com/jepetosouth/al-tool/main/install.sh | bash
```

Or with wget:
```bash
wget -qO- https://raw.githubusercontent.com/jepetosouth/al-tool/main/install.sh | bash
```

#### Method 2: Manual Install
```bash
# Clone the repository
git clone https://github.com/jepetosouth/al-tool.git
cd al-tool

# Make scripts executable
chmod +x install.sh al-tool.sh

# Run installer
./install.sh
```

#### Method 3: Termux Quick Install
```bash
pkg update && pkg install git curl -y
curl -sSL https://raw.githubusercontent.com/jepetosouth/al-tool/main/install.sh | bash
```

### Usage

#### Interactive Mode
Simply run without arguments to use the interactive menu:
```bash
al-tool
```

#### Command-Line Mode
```bash
# Check dependencies
al-tool --check

# Install dependencies
al-tool --install

# Clone ALHacking repository
al-tool --clone

# Run ALHacking tool
al-tool --run

# Full automated setup
al-tool --setup

# Show environment information
al-tool --info

# Show help
al-tool --help
```

## Compatibility

### Tested Environments
- ✅ **Termux** (Android)
- ✅ **NetHunter** (Kali on Android)
- ✅ **Standard Linux** (Debian, Ubuntu, Fedora, etc.)

### Requirements
- Bash shell
- Git (automatically installed if missing)
- Internet connection

## Screenshots

### Interactive Menu
```
╔═══════════════════════════════════════╗
║           AL-Tool v1.0                ║
║   Android/Termux Terminal Interface   ║
╚═══════════════════════════════════════╝

════════════════════════════════════════
1) Check dependencies
2) Install dependencies
3) Clone ALHacking repository
4) Run ALHacking tool
5) Full setup (install + clone)
6) Show environment info
0) Exit
════════════════════════════════════════
```

## Advanced Usage

### Environment Detection
AL-Tool automatically detects your environment and adapts:
- Recognizes Termux by checking `$PREFIX` variable
- Identifies NetHunter from `/etc/os-release`
- Falls back to standard Linux for other systems

### Package Manager Selection
Automatically selects the appropriate package manager:
- **Termux**: Uses `pkg`
- **Debian/Ubuntu/NetHunter**: Uses `apt`
- **Fedora/RHEL**: Uses `yum`

### Custom Installation Directory
```bash
# For Termux: $PREFIX/share/al-tool
# For Linux: $HOME/al-tool
```

## Troubleshooting

### Command not found
If `al-tool` command is not found after installation:
```bash
# Option 1: Reload shell configuration
source ~/.bashrc

# Option 2: Run directly from installation directory
~/al-tool/al-tool.sh

# Option 3: For Termux
$PREFIX/share/al-tool/al-tool.sh
```

### Permission denied
```bash
chmod +x ~/al-tool/al-tool.sh
```

### Dependencies installation failed
```bash
# For Termux
pkg update && pkg upgrade

# For Linux
sudo apt update && sudo apt upgrade
```

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

This project is open source and available for educational purposes.

## Disclaimer

This tool is intended for educational and ethical penetration testing purposes only. Always ensure you have proper authorization before testing any systems.

## Credits

- Original project: [Jeanjj](https://github.com/jepetosouth)
- ALHacking tool: [4lbH4cker](https://github.com/4lbH4cker/ALHacking)
- Web interface: [LiveCodes](https://livecodes.io/?x=https://github.com/jepetosouth/al-tool/tree/gh-pages/src)