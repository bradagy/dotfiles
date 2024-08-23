eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Automatically source bashrc file under circumstances where it would normally
# only process the profile.
source ~/.bashrc

