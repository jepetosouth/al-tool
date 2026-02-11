# AL-Tool - ALHacking Installer for NetHunter

A streamlined installation tool for [ALHacking](https://github.com/4lbH4cker/ALHacking) specifically designed for Kali NetHunter environments on Android devices.

## Overview

AL-Tool simplifies the installation process of the ALHacking toolkit on Android devices through automated installation scripts compatible with Kali NetHunter environments.

## Features

- ✅ Automated dependency installation
- ✅ Kali NetHunter compatibility
- ✅ Error handling and environment detection
- ✅ User-friendly colored output
- ✅ Safe reinstallation with cleanup options

## Requirements

### For Kali NetHunter
- Android device with NetHunter installed
- Root access (recommended for full functionality)
- Active internet connection
- At least 100MB free storage space

## Installation

### Automated Installation (Recommended)

Download and run the installation script:

```bash
# Download the installation script
pkg install wget -y
wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-nethunter.sh
chmod +x install-nethunter.sh

# Run the installer
bash install-nethunter.sh
```

### Manual Installation

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

Or run directly:
```bash
bash ~/ALHacking/alhack.sh
```

## Troubleshooting

### Storage Permission Issues
If you encounter permission errors, grant storage access:
```bash
termux-setup-storage
```

### Internet Connection Issues
- Ensure you have an active internet connection
- Try switching between Wi-Fi and mobile data
- Check if GitHub is accessible from your network

### Repository Clone Failures
If cloning fails, try using an alternate GitHub URL:
```bash
git clone https://github.com/4lbH4cker/ALHacking.git
```

### Package Installation Failures
```bash
# Force update package lists
pkg upgrade -y

# Clean package cache
pkg clean
```

## Environment Notes

### NetHunter
- NetHunter provides additional security and penetration testing tools
- Root access enables full functionality of all tools
- NetHunter includes a Kali Linux environment with pre-installed tools

## Security Notice

⚠️ **Important**: The ALHacking tool and this installer are intended for educational and authorized security testing purposes only. Unauthorized access to computer systems is illegal. Always obtain proper authorization before conducting any security testing.

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests to improve the installation process or add new features.

## Credits

- Original Project: [LiveCodes](https://livecodes.io/?x=https://github.com/jepetosouth/al-tool/tree/gh-pages/src)
- Created by: [Jeanjj](https://github.com/jepetosouth)
- ALHacking Tool: [4lbH4cker](https://github.com/4lbH4cker/ALHacking)

## Support

For issues related to:
- **Installation scripts**: Open an issue in this repository
- **ALHacking tool**: Visit the [ALHacking repository](https://github.com/4lbH4cker/ALHacking)
- **NetHunter**: Visit [NetHunter Documentation](https://www.kali.org/docs/nethunter/)