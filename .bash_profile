# Automatically source bashrc file under circumstances where it would normally
# only process the profile.
source ~/.bashrc

eval "$(/opt/homebrew/bin/brew shellenv)"
