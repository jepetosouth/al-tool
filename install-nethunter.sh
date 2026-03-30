#!/data/data/com.offsec.nethunter/files/usr/bin/bash
# AL-Tool Installation Script for Kali NetHunter
# This script automates the installation of ALHacking tool in NetHunter environment

set -e

echo "================================================"
echo "  AL-Tool Installation Script for NetHunter"
echo "================================================"
echo ""

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[+]${NC} $1"
}

print_error() {
    echo -e "${RED}[!]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[*]${NC} $1"
}

# Check if running on NetHunter or Termux
if [ -d "/data/data/com.offsec.nethunter" ]; then
    print_status "Detected NetHunter environment"
    PKG_CMD="pkg"
elif [ -d "/data/data/com.termux" ]; then
    print_status "Detected Termux environment (NetHunter compatible)"
    PKG_CMD="pkg"
else
    print_warning "NetHunter/Termux environment not detected"
    # Check if we're on a standard Linux system with sudo
    if command -v sudo &> /dev/null; then
        print_warning "Attempting standard Linux installation with sudo..."
        PKG_CMD="apt-get"
    else
        print_error "This script requires Termux, NetHunter, or a Linux system with sudo"
        print_error "Please run this script in a supported environment"
        exit 1
    fi
fi

# Update package list
print_status "Updating package list..."
if [ "$PKG_CMD" = "pkg" ]; then
    pkg update -y
else
    sudo apt-get update -y
fi

# Install required dependencies
print_status "Installing required dependencies..."
if [ "$PKG_CMD" = "pkg" ]; then
    pkg install -y git python wget curl
else
    sudo apt-get install -y git python3 wget curl
fi

# Check if git is installed successfully
if ! command -v git &> /dev/null; then
    print_error "Failed to install git. Please check your internet connection."
    exit 1
fi

print_status "Git installed successfully"

# Create installation directory
INSTALL_DIR="$HOME/ALHacking"

# Check if ALHacking already exists
if [ -d "$INSTALL_DIR" ]; then
    print_warning "ALHacking directory already exists at $INSTALL_DIR"
    read -p "Do you want to remove and reinstall? (y/n): " -r REPLY
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        print_status "Removing existing installation..."
        rm -rf "$INSTALL_DIR"
    else
        print_warning "Installation cancelled"
        exit 0
    fi
fi

# Clone the ALHacking repository
print_status "Cloning ALHacking repository..."
if git clone https://github.com/4lbH4cker/ALHacking "$INSTALL_DIR"; then
    print_status "Repository cloned successfully"
else
    print_error "Failed to clone repository. Please check your internet connection."
    exit 1
fi

# Change to ALHacking directory
cd "$INSTALL_DIR"

# Check if alhack.sh exists
if [ ! -f "alhack.sh" ]; then
    print_error "alhack.sh not found in the repository"
    print_error "The repository structure might have changed"
    exit 1
fi

# Make the script executable
print_status "Making alhack.sh executable..."
chmod +x alhack.sh

# Setup complete
echo ""
echo "================================================"
print_status "Installation completed successfully!"
echo "================================================"
echo ""
echo "To run ALHacking, execute the following commands:"
echo ""
echo "  cd $INSTALL_DIR"
echo "  bash alhack.sh"
echo ""
echo "Or run directly:"
echo "  bash $INSTALL_DIR/alhack.sh"
echo ""
print_warning "Note: NetHunter provides additional security tools"
print_warning "Some features may require root access"
print_warning "Grant storage permission if prompted: termux-setup-storage"
echo ""
