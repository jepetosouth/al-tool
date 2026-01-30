#!/data/data/com.termux/files/usr/bin/bash
# AL-Tool Installation Script for Termux
# This script automates the installation of ALHacking tool in Termux environment

set -e

echo "================================================"
echo "  AL-Tool Installation Script for Termux"
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

# Check if running on Termux
if [ ! -d "/data/data/com.termux" ]; then
    print_error "This script is designed for Termux environment"
    print_error "Please run this script in Termux on Android"
    exit 1
fi

print_status "Detected Termux environment"

# Update package list
print_status "Updating package list..."
pkg update -y

# Install required dependencies
print_status "Installing required dependencies..."
pkg install -y git python wget curl

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
print_warning "Note: Some features may require additional permissions"
print_warning "Grant storage permission if prompted: termux-setup-storage"
echo ""
