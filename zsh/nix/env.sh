#editor
export EDITOR="emacs -nw"
    
export PATH=$PATH:/opt/local/bin:/opt/local/sbin:/usr/local/mysql/bin:/usr/texbin:/bin:/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/local/bin/:/usr/local/git/bin:$HOME/.cabal/bin:/usr/share:/usr/man:/usr/games:/usr/local/sbin:$HOME/.rvm/bin:$HOME/Library/Haskell/bin:$GEM_PATH

# rvm stuff
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export USERWM=`which xmonad`
# export TERM="urxvt"
