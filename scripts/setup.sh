#!/bin/bash

# Load configuration from an external file
source ./dotfiles_config.sh

# Define color codes
RED='\e[31m'
GREEN='\e[32m'
BOLD='\e[1m'
RESET='\e[0m'

get_credentials() {
    echo -e "\n\t${BOLD}Please enter your GitHub credentials:${RESET}"
    read -p "GitHub username: " GITHUB_USERNAME
    read -s -p "GitHub Personal Access Token (PAT): " GITHUB_PAT
    echo -e "\n"
}

# Function to verify GitHub credentials by checking repository access
verify_credentials() {
    REPO_URL="https://$GITHUB_USERNAME:$GITHUB_PAT@github.com/$GITHUB_USERNAME/dotfiles.git"
    if git ls-remote "$REPO_URL" &>/dev/null; then
        echo -e "\n\t${GREEN}${BOLD}GitHub credentials verified successfully.${RESET}"
    else
        echo -e "\n\t${RED}${BOLD}Error: Failed to verify GitHub credentials. Please check your username and PAT.${RESET}"
        exit 1
    fi
}

# Function to clone the dotfiles repo if it doesn't exist
clone_repo() {
    echo -e "\n\t${BOLD}Cloning the dotfiles repository...${RESET}"
    if [ ! -d "$DOTFILES_DIR" ]; then
        if ! git clone "$REPO_URL" "$DOTFILES_DIR"; then
            echo -e "\n\t${RED}${BOLD}Error: Failed to clone the repository. Exiting.${RESET}"
            exit 1
        fi
        sleep 2
    else
        echo -e "\n\t${BOLD}Dotfiles directory already exists. Pulling the latest changes...${RESET}"
        if ! git -C "$DOTFILES_DIR" pull; then
            echo -e "\n\t${RED}${BOLD}Error: Failed to pull the latest changes. Exiting.${RESET}"
            exit 1
        fi
        sleep 2
    fi
}

backup_file() {
    local DESTINATION=$1
    BACKUP_DIR="$HOME/dotfiles_backup"
    mkdir -p "$BACKUP_DIR"
    TIMESTAMP=$(date +"%Y%m%d%H%M")  # Current date and time without seconds
    mv "$DESTINATION" "$BACKUP_DIR/$(basename "$DESTINATION").backup.$TIMESTAMP"
    echo -e "\tBackup created: $BACKUP_DIR/$(basename "$DESTINATION").backup.$TIMESTAMP"
}

create_symlink() {
    local FILE=$1
    SOURCE="$DOTFILES_DIR/$FILE"
    DESTINATION="$HOME/$FILE"
    
    if [ -L "$DESTINATION" ]; then
        echo -e "\n\t${BOLD}Removing existing symlink: $DESTINATION${RESET}"
        rm "$DESTINATION"
        sleep 1
    elif [ -e "$DESTINATION" ]; then
        echo -e "\n\t${BOLD}Backing up existing file: $DESTINATION${RESET}"
        backup_file "$DESTINATION"
        sleep 1
    fi
    
    echo -e "\t${BOLD}Creating symlink: $SOURCE -> $DESTINATION${RESET}"
    if ! ln -s "$SOURCE" "$DESTINATION"; then
        echo -e "\n\t${RED}${BOLD}Error: Failed to create symlink for $FILE. Exiting.${RESET}"
        exit 1
    fi
    sleep 1
}

# Main function to run the script
main() {
    echo -e "\n============================"
    echo -e "    ${BOLD}Dotfiles Setup Script${RESET}"
    echo -e "============================\n"
    
    get_credentials
    
    # Verify GitHub credentials before proceeding
    verify_credentials
    
    echo -e "\n\t${BOLD}Are you sure you want to overwrite existing dotfiles? (y/n)${RESET}"
    read -p "" CONFIRM
    if [[ "$CONFIRM" != "y" ]]; then
        echo -e "\n\t${BOLD}Operation canceled.${RESET}"
        exit 0
    fi
    
    clone_repo
    
    for FILE in "${FILES[@]}"; do
        create_symlink "$FILE"
    done
    
    echo -e "\n\t${GREEN}${BOLD}Dotfiles symlinked successfully!${RESET}\n"
}

main
