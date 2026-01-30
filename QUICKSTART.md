# Quick Start Guide for AL-Tool on Termux/NetHunter

This guide will help you get started with AL-Tool on your Android device quickly.

## Prerequisites Check

Before starting, ensure you have:
- [ ] Termux or NetHunter app installed
- [ ] At least 100MB of free storage
- [ ] Active internet connection
- [ ] Basic familiarity with command-line interface

## 5-Minute Setup

### 1. Open Termux/NetHunter Terminal

Launch the Termux or NetHunter app on your Android device.

### 2. Grant Storage Permissions (First Time Only)

```bash
termux-setup-storage
```

When prompted, allow storage access. This is needed for saving files and configurations.

### 3. Update Package Manager

```bash
pkg update && pkg upgrade -y
```

This ensures you have the latest package information.

### 4. Install AL-Tool

Choose one of these methods:

#### Option A: Download and Review (Recommended for Security)
```bash
pkg install wget -y
wget https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh
# Review the script before running
cat install-termux.sh
# If satisfied, make executable and run
chmod +x install-termux.sh
./install-termux.sh
```

#### Option B: Quick Install (One Command)
⚠️ **Security Note**: This method downloads and executes code immediately. Use only if you trust the source.

```bash
pkg install wget -y && wget -O - https://raw.githubusercontent.com/jepetosouth/al-tool/main/install-termux.sh | bash
```

### 5. Run ALHacking

After installation completes:
```bash
cd ~/ALHacking
bash alhack.sh
```

## What to Expect

The installation script will:
1. ✓ Check your environment (Termux/NetHunter)
2. ✓ Install required packages (git, python, wget, curl)
3. ✓ Clone the ALHacking repository
4. ✓ Set up executable permissions
5. ✓ Display success message with usage instructions

Total installation time: ~2-5 minutes (depending on internet speed)

## Common First-Time Issues

### Issue: "Permission denied"
**Solution:**
```bash
chmod +x install-termux.sh
```

### Issue: "Command not found: wget"
**Solution:**
```bash
pkg install wget -y
```

### Issue: "Unable to locate package"
**Solution:**
```bash
pkg update -y
pkg upgrade -y
```

### Issue: "Storage permission required"
**Solution:**
```bash
termux-setup-storage
# Then allow permission when prompted
```

## Next Steps

After successful installation:

1. **Explore ALHacking Features**: Run `bash alhack.sh` and follow the menu
2. **Learn the Tools**: Familiarize yourself with available options
3. **Practice Safely**: Only use on systems you own or have authorization to test
4. **Join Community**: Check the repository for updates and community discussions

## Tips for Best Experience

- 📱 Use a device with at least 2GB RAM for smooth operation
- 🔋 Keep your device charged during installation
- 📶 Use stable Wi-Fi for faster downloads
- 💾 Regularly update packages: `pkg update && pkg upgrade`
- 🔒 Always ensure you have proper authorization before using security tools

## Getting Help

If you encounter issues:
1. Check the [main README](README.md) for troubleshooting
2. Review the error messages carefully
3. Search for similar issues on GitHub
4. Open an issue with detailed error information

## Video Tutorial (Optional)

For a visual walkthrough, you can record your successful installation and share it with the community!

---

**Ready to start?** Just copy and paste the commands above! 🚀
