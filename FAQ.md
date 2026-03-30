# Frequently Asked Questions (FAQ)

**[English](FAQ.md)** | [Français](FAQ.fr.md)

## General Questions

### What is AL-Tool?
AL-Tool is an automated installation helper for the ALHacking toolkit, specifically designed to work seamlessly on Termux and Kali NetHunter environments on Android devices.

### Do I need root access?
No, AL-Tool works without root access on standard Termux. However, some advanced features of the ALHacking toolkit may require root access, particularly on NetHunter.

### Is this legal?
The tool itself is legal. However, how you use it matters:
- ✅ **Legal**: Testing your own systems, authorized penetration testing, educational purposes
- ❌ **Illegal**: Unauthorized access to systems, hacking without permission, malicious activities

**Always obtain proper authorization before testing any system you don't own.**

### Is this safe to use?
Yes, the installation scripts are safe. They only:
- Install standard packages (git, python, wget, curl)
- Clone the ALHacking repository
- Set up file permissions

However, always review scripts before running them, and download only from official sources.

## Installation Questions

### Why should I use F-Droid Termux instead of Google Play?
The Termux version on Google Play is outdated and no longer maintained. F-Droid provides the latest, actively maintained version with all features and security updates.

### How much storage space do I need?
- **Minimum**: 100MB
- **Recommended**: 500MB to 1GB for updates and additional tools

### How long does installation take?
Typically 2-5 minutes, depending on:
- Internet connection speed
- Device performance
- Server load

### Can I install this on multiple devices?
Yes! You can install AL-Tool on as many devices as you want. Each installation is independent.

### Do I need to be connected to Wi-Fi?
While not strictly required, Wi-Fi is recommended for:
- Faster downloads
- Avoiding mobile data usage
- More stable connection

## Compatibility Questions

### Which Android versions are supported?
- **Minimum**: Android 7.0 (Nougat)
- **Recommended**: Android 10.0 or higher
- **Best Experience**: Android 11+

### Does this work on iOS?
No, AL-Tool is specifically designed for Android devices with Termux or NetHunter. iOS uses a different architecture and doesn't support these environments.

### What's the difference between Termux and NetHunter?
- **Termux**: Basic Linux environment on Android, no root required
- **NetHunter**: Full Kali Linux environment with pre-installed security tools, works better with root

Both are compatible with AL-Tool.

### Will this work on tablets?
Yes! AL-Tool works on any Android device that can run Termux or NetHunter, including tablets.

## Troubleshooting Questions

### Installation fails with "Permission denied"
**Solutions**:
1. Grant storage permission: `termux-setup-storage`
2. Make script executable: `chmod +x install-termux.sh`
3. Check available storage: `df -h`

### "Command not found" errors
**Solution**: Update package lists first
```bash
pkg update -y
pkg upgrade -y
```

### Git clone fails or times out
**Solutions**:
1. Check internet connection
2. Try switching between Wi-Fi and mobile data
3. Use VPN if GitHub is blocked
4. Try again later (server might be busy)

### "Package not found" error
**Solution**: Update package database
```bash
pkg update
pkg upgrade
```

### How do I completely uninstall?
```bash
# Remove ALHacking
rm -rf ~/ALHacking

# Optionally remove installed packages
pkg uninstall git python wget curl
```

### The tool isn't working after installation
**Verification steps**:
```bash
# Check installation
ls -la ~/ALHacking

# Verify script exists
ls -l ~/ALHacking/alhack.sh

# Try running manually
cd ~/ALHacking
bash alhack.sh
```

## Usage Questions

### How do I run ALHacking after installation?
```bash
cd ~/ALHacking
bash alhack.sh
```

Or directly:
```bash
bash ~/ALHacking/alhack.sh
```

### Can I update ALHacking?
Yes, update via git:
```bash
cd ~/ALHacking
git pull
```

### Where are files saved?
By default, files are saved in:
- Installation: `~/ALHacking/`
- Termux home: `/data/data/com.termux/files/home/`
- Shared storage: `~/storage/` (after running `termux-setup-storage`)

### How do I access my device storage from Termux?
```bash
termux-setup-storage
```
Then grant permission. Your storage will be accessible at `~/storage/`

### Can I run this in the background?
Yes, you can use terminal multiplexers:
```bash
# Install tmux
pkg install tmux -y

# Run in tmux session
tmux
cd ~/ALHacking
bash alhack.sh
# Detach: Ctrl+B, then D
```

## Security Questions

### Is my data safe?
The installation scripts don't collect or transmit any personal data. However:
- Always review scripts before running
- Download only from official sources
- Keep your device and apps updated

### Can this get me in trouble?
Using the tool itself is not illegal, but:
- ❌ Unauthorized system access IS illegal
- ❌ Using tools maliciously IS illegal
- ✅ Authorized testing and education IS legal

**Always get written permission before testing any system.**

### Should I use a VPN?
For general usage:
- Installation: Not required
- Learning: Not required
- Testing own systems: Not required
- Authorized penetration testing: Follow client requirements

### What if I accidentally target the wrong system?
- Stop immediately
- Document what happened
- Report to system owner if external system
- Learn from the mistake
- Always triple-check targets before testing

## Performance Questions

### The tool is running slowly
**Common causes and solutions**:
1. **Low RAM**: Close other apps
2. **Low storage**: Free up space
3. **Slow internet**: Use Wi-Fi
4. **Background processes**: Restart device

### Can I speed up the installation?
**Tips**:
- Use Wi-Fi instead of mobile data
- Install during off-peak hours
- Keep device charged
- Close unnecessary apps

### Does this drain my battery?
The installation process itself doesn't significantly drain battery. However, running security tools may be resource-intensive.

## Advanced Questions

### Can I customize the installation location?
Yes, modify the script's `INSTALL_DIR` variable before running:
```bash
# Edit the script
nano install-termux.sh

# Change this line:
INSTALL_DIR="$HOME/ALHacking"
# To your preferred location:
INSTALL_DIR="$HOME/my-custom-location"
```

### Can I automate the installation?
For non-interactive installation, you can modify the script to skip prompts, but this is not recommended for beginners.

### How do I contribute to AL-Tool?
See [CONTRIBUTING.md](CONTRIBUTING.md) for detailed guidelines on:
- Reporting bugs
- Suggesting features
- Submitting pull requests
- Code style guidelines

### Can I use this with other tools?
Yes! The installation doesn't interfere with other tools. You can have multiple security tools installed simultaneously.

### How do I keep everything updated?
```bash
# Update Termux packages
pkg update && pkg upgrade -y

# Update ALHacking
cd ~/ALHacking
git pull

# Update AL-Tool scripts
# Re-download the latest installation script
```

## Getting More Help

### Where can I find more information?
- **Main README**: [README.md](README.md)
- **Quick Start**: [QUICKSTART.md](QUICKSTART.md)
- **Requirements**: [REQUIREMENTS.md](REQUIREMENTS.md)
- **Testing Guide**: [TESTING.md](TESTING.md)
- **Contributing**: [CONTRIBUTING.md](CONTRIBUTING.md)

### How do I report bugs?
1. Check if the issue already exists
2. Gather environment information
3. Document steps to reproduce
4. Open an issue on GitHub with details

### Can I request features?
Yes! Open an issue with:
- Clear description of the feature
- Use case explanation
- Why it would be beneficial

### Where's the community?
- **GitHub Issues**: Bug reports and discussions
- **GitHub Discussions**: General questions and help
- **Pull Requests**: Code contributions

### I have a question not answered here
1. Check the documentation files
2. Search existing GitHub issues
3. Open a new issue with the "question" label
4. Be specific and provide context

---

**Still have questions?** Feel free to open an issue on GitHub! 🚀
