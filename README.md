# AL-Tool - ALHacking Installer for Termux/NetHunter

A streamlined installation tool for [ALHacking](https://github.com/4lbH4cker/ALHacking) specifically designed for Termux and Kali NetHunter environments on Android devices.

## Overview

AL-Tool simplifies the installation process of the ALHacking toolkit on Android devices through automated installation scripts compatible with both Termux and Kali NetHunter environments.

## Features

- ✅ Automated dependency installation
- ✅ Termux environment support
- ✅ Kali NetHunter compatibility
- ✅ Error handling and environment detection
- ✅ User-friendly colored output
- ✅ Safe reinstallation with cleanup options

## Requirements

### For Termux
- Android device with Termux app installed
- Active internet connection
- At least 100MB free storage space

### For Kali NetHunter
- Android device with NetHunter installed
- Root access (recommended for full functionality)
- Active internet connection
- At least 100MB free storage space

## Installation

### Method 1: Automated Installation (Recommended)

#### For Termux:
```bash
# Download and run the installation script
pkg install wget -y
wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh
chmod +x install-termux.sh
bash install-termux.sh
```

#### For NetHunter:
```bash
# Download and run the installation script
pkg install wget -y
wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-nethunter.sh
chmod +x install-nethunter.sh
bash install-nethunter.sh
```

### Method 2: Manual Installation

If you prefer to install manually, follow these steps:

#### Step 1: Install Dependencies
```bash
# Update package list
pkg update -y

# Install required packages
pkg install git python wget curl -y
```

#### Step 2: Clone ALHacking Repository
```bash
# Clone the repository
git clone https://github.com/4lbH4cker/ALHacking
cd ALHacking
```

#### Step 3: Run ALHacking
```bash
# Make the script executable
chmod +x alhack.sh

# Run the tool
bash alhack.sh
```

## Usage

After successful installation, you can run ALHacking with:

```bash
cd ~/ALHacking
bash alhack.sh
```

Or directly:
```bash
bash ~/ALHacking/alhack.sh
```

## Troubleshooting

### Storage Permission Issues
If you encounter permission errors, grant Termux storage access:
```bash
termux-setup-storage
```

### Internet Connection Issues
- Ensure you have an active internet connection
- Try switching between Wi-Fi and mobile data
- Check if GitHub is accessible from your network

### Repository Clone Failures
If cloning fails, try:
```bash
# Clear DNS cache
pkg install dnsutils -y

# Use alternate GitHub URL
git clone https://github.com/4lbH4cker/ALHacking.git
```

### Package Installation Failures
```bash
# Force update package lists
pkg upgrade -y

# Clean package cache
pkg clean
```

## Environment-Specific Notes

### Termux
- Termux provides a Linux environment on Android without requiring root
- Storage access may require additional setup via `termux-setup-storage`
- Some tools may have limited functionality without root access

### NetHunter
- NetHunter provides additional security and penetration testing tools
- Root access enables full functionality of all tools
- NetHunter includes a Kali Linux environment with pre-installed tools

## Security Notice

⚠️ **Important**: The ALHacking tool and this installer are intended for educational and authorized security testing purposes only. Unauthorized access to computer systems is illegal. Always obtain proper authorization before conducting any security testing.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests to improve the installation process or add new features.

## License

This project is provided as-is for educational purposes. Please refer to the [ALHacking repository](https://github.com/4lbH4cker/ALHacking) for license information about the main tool.

## Credits

- Original Project: [LiveCodes](https://livecodes.io/?x=https://github.com/jepetosouth/al-tool/tree/gh-pages/src)
- Created by: [Jeanjj](https://github.com/jepetosouth)
- ALHacking Tool: [4lbH4cker](https://github.com/4lbH4cker/ALHacking)

## Support

For issues related to:
- **Installation scripts**: Open an issue in this repository
- **ALHacking tool**: Visit the [ALHacking repository](https://github.com/4lbH4cker/ALHacking)
- **Termux**: Check [Termux Wiki](https://wiki.termux.com/)
- **NetHunter**: Visit [NetHunter Documentation](https://www.kali.org/docs/nethunter/)