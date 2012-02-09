#emacs mode for zshell
set -o emacs

#load rvm - ruby on rails stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#editor for git and other stuff
export EDITOR="/opt/local/bin/emacs"

#Remove commands from history that have a space preceding them
setopt HIST_IGNORE_SPACE
