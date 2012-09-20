#!/bin/bash

unamestr=`uname`

if [ "$(uname)" = 'Darwin' ];
  then
source $HOME/Dropbox/bin/dotfiles/zsh/osx/env.sh
source $HOME/Dropbox/bin/dotfiles/zsh/osx/config.sh
source $HOME/Dropbox/bin/dotfiles/zsh/osx/aliases.sh 
source $HOME/Dropbox/bin/dotfiles/scripts/
elif [ "$(uname)" = 'Linux' ];
  then
source $HOME/Dropbox/bin/dotfiles/zsh/nix/env.sh
source $HOME/Dropbox/bin/dotfiles/zsh/nix/config.sh
source $HOME/Dropbox/bin/dotfiles/zsh/nix/aliases.sh 
fi

