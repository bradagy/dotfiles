#!/bin/bash

RED='\e[31m'
GREEN='\e[32m'
BOLD='\e[1m'
RESET='\e[0m'

pause() {
    sleep 2
}

install_package() {
    local package=$1
    echo -e "\n\t${BOLD}Installing $package...${RESET}"
    brew install "$package"
    pause
}

echo -e "\n${BOLD}Updating Homebrew...${RESET}"
brew update
pause

packages=("git" "node" "nvm" "tmux" "tree" "fzf")

for package in "${packages[@]}"; do
    install_package "$package"
done

echo -e "\n${GREEN}${BOLD}All requested packages have been installed!${RESET}\n"
