#!/bin/bash

# AL-Tool - Android/Termux Compatible Terminal Interface
# Compatible with Termux and NetHunter environments

# Color codes for better UI
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Banner
print_banner() {
    echo -e "${BLUE}"
    echo "╔═══════════════════════════════════════╗"
    echo "║           AL-Tool v1.0                ║"
    echo "║   Android/Termux Terminal Interface   ║"
    echo "╚═══════════════════════════════════════╝"
    echo -e "${NC}"
}

# Environment detection
detect_environment() {
    if [ -d "$PREFIX" ] && [ "$PREFIX" = "/data/data/com.termux/files/usr" ]; then
        echo "termux"
    elif [ -f "/etc/os-release" ] && grep -q "Kali" /etc/os-release; then
        echo "nethunter"
    else
        echo "linux"
    fi
}

# Package manager detection
get_package_manager() {
    local env=$1
    case $env in
        termux)
            echo "pkg"
            ;;
        nethunter)
            echo "apt"
            ;;
        linux)
            if command -v apt >/dev/null 2>&1; then
                echo "apt"
            elif command -v yum >/dev/null 2>&1; then
                echo "yum"
            elif command -v pkg >/dev/null 2>&1; then
                echo "pkg"
            else
                echo "unknown"
            fi
            ;;
        *)
            echo "unknown"
            ;;
    esac
}

# Check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check dependencies
check_dependencies() {
    echo -e "${YELLOW}[*]${NC} Checking dependencies..."
    
    local missing_deps=()
    
    if ! command_exists git; then
        missing_deps+=("git")
    fi
    
    if ! command_exists bash; then
        missing_deps+=("bash")
    fi
    
    if [ ${#missing_deps[@]} -eq 0 ]; then
        echo -e "${GREEN}[✓]${NC} All dependencies satisfied"
        return 0
    else
        echo -e "${RED}[!]${NC} Missing dependencies: ${missing_deps[*]}"
        return 1
    fi
}

# Install dependencies
install_dependencies() {
    local env=$(detect_environment)
    local pkg_manager=$(get_package_manager "$env")
    
    echo -e "${YELLOW}[*]${NC} Installing dependencies..."
    echo -e "${YELLOW}[*]${NC} Detected environment: $env"
    echo -e "${YELLOW}[*]${NC} Using package manager: $pkg_manager"
    
    if [ "$pkg_manager" = "unknown" ]; then
        echo -e "${RED}[!]${NC} Could not detect package manager"
        echo -e "${YELLOW}[*]${NC} Please install git and bash manually"
        return 1
    fi
    
    # Update package lists
    echo -e "${YELLOW}[*]${NC} Updating package lists..."
    if [ "$pkg_manager" = "pkg" ]; then
        pkg update -y
    else
        # Try with sudo first, then without if it fails
        if command -v sudo >/dev/null 2>&1 && [ "$(id -u)" -ne 0 ]; then
            if ! sudo apt update -y 2>/dev/null; then
                echo -e "${YELLOW}[!]${NC} sudo failed, trying without sudo..."
                apt update -y || echo -e "${YELLOW}[!]${NC} Package update failed, continuing anyway..."
            fi
        else
            apt update -y || echo -e "${YELLOW}[!]${NC} Package update failed, continuing anyway..."
        fi
    fi
    
    # Install git
    if ! command_exists git; then
        echo -e "${YELLOW}[*]${NC} Installing git..."
        if [ "$pkg_manager" = "pkg" ]; then
            pkg install git -y
        else
            if command -v sudo >/dev/null 2>&1 && [ "$(id -u)" -ne 0 ]; then
                if ! sudo apt install git -y 2>/dev/null; then
                    echo -e "${YELLOW}[!]${NC} sudo failed, trying without sudo..."
                    apt install git -y || echo -e "${RED}[!]${NC} Failed to install git"
                fi
            else
                apt install git -y || echo -e "${RED}[!]${NC} Failed to install git"
            fi
        fi
    fi
    
    # Install bash (usually pre-installed)
    if ! command_exists bash; then
        echo -e "${YELLOW}[*]${NC} Installing bash..."
        if [ "$pkg_manager" = "pkg" ]; then
            pkg install bash -y
        else
            if command -v sudo >/dev/null 2>&1 && [ "$(id -u)" -ne 0 ]; then
                if ! sudo apt install bash -y 2>/dev/null; then
                    echo -e "${YELLOW}[!]${NC} sudo failed, trying without sudo..."
                    apt install bash -y || echo -e "${RED}[!]${NC} Failed to install bash"
                fi
            else
                apt install bash -y || echo -e "${RED}[!]${NC} Failed to install bash"
            fi
        fi
    fi
    
    echo -e "${GREEN}[✓]${NC} Dependencies installed successfully"
}

# Clone ALHacking repository
clone_alhacking() {
    local repo_url="https://github.com/4lbH4cker/ALHacking"
    local repo_dir="ALHacking"
    
    echo -e "${YELLOW}[*]${NC} Cloning ALHacking repository..."
    
    if [ -d "$repo_dir" ]; then
        echo -e "${YELLOW}[!]${NC} Directory $repo_dir already exists"
        read -p "Do you want to remove it and clone again? (y/n): " -r
        
        # Check if REPLY is set and not empty
        if [ -z "${REPLY+x}" ] || [ -z "$REPLY" ]; then
            echo -e "${YELLOW}[*]${NC} No input received, using existing directory"
            return 0
        fi
        
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            rm -rf "$repo_dir"
        else
            echo -e "${YELLOW}[*]${NC} Using existing directory"
            return 0
        fi
    fi
    
    if git clone "$repo_url"; then
        echo -e "${GREEN}[✓]${NC} Repository cloned successfully"
        return 0
    else
        echo -e "${RED}[!]${NC} Failed to clone repository"
        return 1
    fi
}

# Run ALHacking script
run_alhacking() {
    local repo_dir="ALHacking"
    local script_name="alhack.sh"
    
    if [ ! -d "$repo_dir" ]; then
        echo -e "${RED}[!]${NC} ALHacking directory not found"
        return 1
    fi
    
    # Use subshell to isolate directory change
    (
        cd "$repo_dir" || exit 1
        
        if [ ! -f "$script_name" ]; then
            echo -e "${RED}[!]${NC} Script $script_name not found"
            exit 1
        fi
        
        echo -e "${YELLOW}[*]${NC} Making script executable..."
        chmod +x "$script_name"
        
        echo -e "${YELLOW}[*]${NC} Running $script_name..."
        bash "$script_name"
    )
    
    local exit_code=$?
    if [ $exit_code -ne 0 ]; then
        echo -e "${RED}[!]${NC} Script execution failed with exit code $exit_code"
        return 1
    fi
    
    return 0
}

# Interactive menu
show_menu() {
    echo ""
    echo -e "${BLUE}════════════════════════════════════════${NC}"
    echo "1) Check dependencies"
    echo "2) Install dependencies"
    echo "3) Clone ALHacking repository"
    echo "4) Run ALHacking tool"
    echo "5) Full setup (install + clone)"
    echo "6) Show environment info"
    echo "0) Exit"
    echo -e "${BLUE}════════════════════════════════════════${NC}"
    echo -n "Select option: "
}

# Show environment information
show_env_info() {
    local env=$(detect_environment)
    local pkg_manager=$(get_package_manager "$env")
    
    echo -e "${BLUE}════════════════════════════════════════${NC}"
    echo -e "${YELLOW}Environment Information:${NC}"
    echo -e "  Environment: $env"
    echo -e "  Package Manager: $pkg_manager"
    echo -e "  Shell: $SHELL"
    echo -e "  Working Directory: $(pwd)"
    echo -e "  Home: $HOME"
    if [ -n "$PREFIX" ]; then
        echo -e "  Prefix: $PREFIX"
    fi
    echo -e "${BLUE}════════════════════════════════════════${NC}"
}

# Full setup
full_setup() {
    echo -e "${YELLOW}[*]${NC} Starting full setup..."
    
    if ! check_dependencies; then
        if ! install_dependencies; then
            echo -e "${RED}[!]${NC} Failed to install dependencies"
            return 1
        fi
    fi
    
    if ! clone_alhacking; then
        echo -e "${RED}[!]${NC} Failed to clone repository"
        return 1
    fi
    
    echo -e "${GREEN}[✓]${NC} Setup completed successfully"
    echo -e "${YELLOW}[*]${NC} You can now run the ALHacking tool (option 4)"
}

# Main function
main() {
    print_banner
    
    # If arguments provided, run in non-interactive mode
    if [ $# -gt 0 ]; then
        case $1 in
            --check|-c)
                check_dependencies
                ;;
            --install|-i)
                install_dependencies
                ;;
            --clone|-cl)
                clone_alhacking
                ;;
            --run|-r)
                run_alhacking
                ;;
            --setup|-s)
                full_setup
                ;;
            --info)
                show_env_info
                ;;
            --help|-h)
                echo "Usage: $0 [OPTION]"
                echo ""
                echo "Options:"
                echo "  -c, --check     Check dependencies"
                echo "  -i, --install   Install dependencies"
                echo "  -cl, --clone    Clone ALHacking repository"
                echo "  -r, --run       Run ALHacking tool"
                echo "  -s, --setup     Full setup (install + clone)"
                echo "  --info          Show environment information"
                echo "  -h, --help      Show this help message"
                echo ""
                echo "No arguments: Run in interactive mode"
                ;;
            *)
                echo -e "${RED}[!]${NC} Unknown option: $1"
                echo "Use --help for usage information"
                exit 1
                ;;
        esac
        exit 0
    fi
    
    # Interactive mode
    while true; do
        show_menu
        read -r option
        
        case $option in
            1)
                check_dependencies
                ;;
            2)
                install_dependencies
                ;;
            3)
                clone_alhacking
                ;;
            4)
                run_alhacking
                ;;
            5)
                full_setup
                ;;
            6)
                show_env_info
                ;;
            0)
                echo -e "${GREEN}[✓]${NC} Exiting..."
                exit 0
                ;;
            *)
                echo -e "${RED}[!]${NC} Invalid option"
                ;;
        esac
        
        echo ""
        read -p "Press Enter to continue..."
    done
}

# Run main function
main "$@"
