#editor
export EDITOR="emacs"

# Path to your oh-my-zsh configuration.                                         
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.                                               
export ZSH_THEME="weatherby"

# Set to this to use case-sensitive completion                                 
# export CASE_SENSITIVE="true"                                                  

# Disable autosetting terminal title.   
export DISABLE_AUTO_TITLE="true"

# Plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)                                           
# Example format: plugins=(rails git textmate ruby lighthouse)                  
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...                                                   
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/texbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin/:/usr/local/git/bin:$HOME/.cabal/bin:/usr/share:/usr/man:/usr/games:/usr/local/bin

# for cabal
export PATH="$HOME/Library/Haskell/bin:$PATH"

# rvm stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#export TERM="xterm-256"
export USERWM=`which xmonad`

