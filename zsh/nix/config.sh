#emacs mode for zshell
set -o emacs

#load rvm - ruby on rails stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#Remove commands from history that have a space preceding them
setopt HIST_IGNORE_SPACE
