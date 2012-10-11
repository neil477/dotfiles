#editor
export EDITOR="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"
    
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/texbin:/bin:/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/git/bin:$HOME/.cabal/bin:/usr/share:/usr/man:/usr/games:/usr/local/sbin

# for cabal
export PATH="$HOME/Library/Haskell/bin:$PATH"

# rvm stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

#node version manager
. $HOME/nvm/nvm.sh

