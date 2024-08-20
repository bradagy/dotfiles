#!/bin/bash

pause() {
    sleep 2
}

echo "Updating Homebrew..."
brew update
pause

echo "Installing Git..."
brew install git
pause

echo "Installing Node.js..."
brew install node
pause

echo "Installing NVM..."
brew install nvm
pause

echo "Installing Tmux..."
brew install tmux
pause

echo "Installing Tree..."
brew install tree
pause

echo "All requested packages have been installed!"
