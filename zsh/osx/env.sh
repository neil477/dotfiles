#editor
export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

# Path to your oh-my-zsh configuration.                                         
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.                                               
export ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion                                 
# export CASE_SENSITIVE="true"                                                  

export DISABLE_AUTO_UPDATE="true"

# Disable autosetting terminal title.   
export DISABLE_AUTO_TITLE="true"

# Plugins to load (plugins can be found in ~/.oh-my-zsh/plugins/*)                                           
# Example format: plugins=(rails git textmate ruby lighthouse)                  
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...                                                   
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/texbin:/bin:/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/bin/:/usr/local/git/bin:$HOME/.cabal/bin:/usr/share:/usr/man:/usr/games:/usr/local/sbin

# for cabal
export PATH="$HOME/Library/Haskell/bin:$PATH"

# rvm stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export USERWM=`which xmonad`
# export TERM="urxvt"
