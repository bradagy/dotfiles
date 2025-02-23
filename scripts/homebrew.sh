#!/bin/bash

#
# =========================================
#    Homebrew Package Installation Script
# =========================================
#

# Color variables
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
BOLD='\e[1m'
RESET='\e[0m'

# 2-second pause for readability
pause() {
    sleep 2
}

# Function to install a package
install_package() {
    local package=$1

    # Print section header
    echo -e "${BOLD}--------------------------------------------${RESET}"
    echo -e " Checking package: $package"
    echo -e "${BOLD}--------------------------------------------${RESET}"

    # Check if it's already installed
    if brew list --formula | grep -q "^${package}\$"; then
        echo -e "${GREEN}${BOLD}Package '$package' is already installed. Skipping.${RESET}\n"
    else
        echo -e "${BOLD}Installing package '$package'...${RESET}"
        brew install "$package"

        # Error handling
        if [ $? -ne 0 ]; then
            echo -e "${RED}${BOLD}Failed to install '$package'. Exiting.${RESET}"
            exit 1
        fi
        echo -e "${GREEN}${BOLD}Successfully installed '$package'.${RESET}\n"
    fi

    pause
}

# --- MAIN SCRIPT STARTS HERE ---

# 1) Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo -e "${RED}${BOLD}Homebrew is not installed. Please install Homebrew first.${RESET}"
    exit 1
fi

# 2) Heading: Update Homebrew
echo -e "\n${YELLOW}${BOLD}============================================"
echo -e "     Updating Homebrew Repository"
echo -e "============================================${RESET}"
brew update
# Uncomment this if you want to also upgrade all installed packages:
# brew upgrade
pause

# 3) Define default packages and parse user arguments
default_packages=("git" "node" "nvm" "tmux" "tree" "btop" "python")
user_packages=("$@")

# Combine them
all_packages=("${default_packages[@]}" "${user_packages[@]}")

# 4) Installation phase
echo -e "\n${YELLOW}${BOLD}============================================"
echo -e "     Installing All Packages"
echo -e "============================================${RESET}"

for package in "${all_packages[@]}"; do
    install_package "$package"
done

# 5) Completion message
echo -e "${GREEN}${BOLD}============================================"
echo -e "     All requested packages are done!"
echo -e "============================================${RESET}\n"
