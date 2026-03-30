# Requirements and Dependencies

## System Requirements

### Minimum Requirements
- **Platform**: Android 7.0 (Nougat) or higher
- **RAM**: 1GB minimum, 2GB recommended
- **Storage**: 100MB free space minimum, 500MB recommended
- **Internet**: Active connection required for installation

### Recommended Requirements
- **Platform**: Android 10.0 or higher
- **RAM**: 3GB or more
- **Storage**: 1GB free space
- **Internet**: Wi-Fi connection for faster downloads
- **Root Access**: Optional, but enables additional features

## Software Requirements

### Core Applications

#### For Termux Users
- **Termux**: Latest version from F-Droid (recommended) or GitHub releases
  - Download: https://f-droid.org/en/packages/com.termux/
  - Note: Google Play Store version is outdated and unsupported

#### For NetHunter Users
- **Kali NetHunter**: Latest stable release
  - Full Installation, NetHunter Lite, or NetHunter Rootless
  - Download: https://www.kali.org/get-kali/#kali-mobile

### Package Dependencies

The installation scripts automatically install the following packages:

#### Required Packages
- `git` - Version control system for cloning repositories
- `python` - Python interpreter (Python 2.7 or 3.x)
- `wget` - Command-line downloader
- `curl` - Data transfer tool

#### Optional Packages (Enhanced Functionality)
- `termux-api` - Access Android APIs from Termux
- `openssh` - Secure shell connectivity
- `nano` or `vim` - Text editors for configuration
- `dnsutils` - DNS troubleshooting tools

## Installation of Dependencies

### Automatic Installation
The provided installation scripts (`install-termux.sh` and `install-nethunter.sh`) automatically install all required dependencies.

### Manual Installation

If you prefer to install dependencies manually:

```bash
# Update package repositories
pkg update -y

# Install core dependencies
pkg install git python wget curl -y

# Optional: Install additional useful tools
pkg install termux-api openssh nano dnsutils -y
```

## ALHacking Tool Requirements

The ALHacking tool itself may have additional requirements:

### Expected Dependencies
- Bash shell (pre-installed in Termux/NetHunter)
- Basic Linux command-line tools
- Network access for certain features

### Tool-Specific Requirements
Please refer to the [ALHacking repository](https://github.com/4lbH4cker/ALHacking) for specific tool requirements and dependencies.

## Environment-Specific Considerations

### Termux Environment
- **Package Manager**: Uses `pkg` (wrapper for `apt`)
- **Package Repository**: Official Termux repository
- **Python Version**: Python 3.x is default
- **Root Access**: Not required for basic functionality
- **Storage Access**: Requires `termux-setup-storage` for file access

### NetHunter Environment
- **Package Manager**: Uses `pkg` or `apt`
- **Package Repository**: NetHunter repositories + Termux repositories
- **Python Version**: Both Python 2 and 3 available
- **Root Access**: Available if device is rooted
- **Additional Tools**: Pre-installed Kali Linux security tools

## Disk Space Breakdown

Approximate storage usage:

```
Package Dependencies:     ~50MB
ALHacking Repository:     ~30MB
Runtime Data:            ~20MB
Total:                   ~100MB
```

Recommended free space: 500MB to allow for updates and additional tools.

## Network Requirements

### Installation Phase
- Stable internet connection required
- Bandwidth: ~100MB download
- Recommended: Wi-Fi connection

### Runtime Phase
- Internet connection may be required for certain tools
- Offline functionality available for some features
- VPN compatibility supported

## Permissions Required

### Android Permissions
- **Storage Access**: Required for saving configurations and data
  - Granted via: `termux-setup-storage`
- **Network Access**: Required for installation and some tools
  - Usually granted by default

### Optional Permissions
- **Root Access**: Enables advanced features (NetHunter users)
- **Location Access**: May be used by specific tools
- **Camera Access**: For tools that require camera input

## Compatibility Matrix

| Feature | Termux | NetHunter | NetHunter Root |
|---------|--------|-----------|----------------|
| Basic Installation | ✅ | ✅ | ✅ |
| Package Management | ✅ | ✅ | ✅ |
| Python Scripts | ✅ | ✅ | ✅ |
| Network Tools | ✅ | ✅ | ✅ |
| Advanced Features | ⚠️ Limited | ✅ | ✅ |
| System-level Access | ❌ | ⚠️ Limited | ✅ |

Legend:
- ✅ Fully Supported
- ⚠️ Partially Supported
- ❌ Not Supported

## Verification Commands

To verify your environment meets requirements:

```bash
# Check Termux/NetHunter installation
echo $PREFIX

# Check available storage
df -h $HOME

# Check Python version
python --version

# Check git installation
git --version

# Check available RAM
free -h

# Check Android version
getprop ro.build.version.release
```

## Updating Dependencies

To keep your environment up-to-date:

```bash
# Update package lists
pkg update

# Upgrade all packages
pkg upgrade -y

# Update ALHacking tool
cd ~/ALHacking
git pull
```

## Troubleshooting Dependency Issues

### Issue: Package not found
```bash
pkg update
pkg upgrade -y
```

### Issue: Insufficient storage
```bash
# Check usage
du -sh ~/ALHacking

# Clean package cache
pkg clean
```

### Issue: Python version conflict
```bash
# Install specific Python version
pkg install python
# or
pkg install python2
```

## Security Considerations

- Keep all packages updated regularly
- Only install packages from official repositories
- Verify checksums when downloading files
- Use secure network connections (avoid public Wi-Fi for sensitive operations)
- Review script contents before execution

## Support and Updates

- **Package Updates**: Automatic through `pkg update`
- **ALHacking Updates**: Manual via `git pull`
- **Script Updates**: Check this repository for latest versions

For detailed information about specific tools and their requirements, refer to the [ALHacking repository](https://github.com/4lbH4cker/ALHacking).
