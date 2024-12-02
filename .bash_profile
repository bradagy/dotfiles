eval "$(/opt/homebrew/bin/brew shellenv)"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias python="python3"

# Automatically source bashrc file under circumstances where it would normally
# only process the profile.
source ~/.bashrc

