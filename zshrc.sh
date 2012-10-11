#!/bin/bash

unamestr=`uname`

if [ "$(uname)" = 'Darwin' ];
  then
source $PRE/dotfiles/zsh/osx/env.sh
source $PRE/dotfiles/zsh/osx/config.sh
source $PRE/dotfiles/zsh/osx/aliases.sh 
source $PRE/dotfiles/scripts/
elif [ "$(uname)" = 'Linux' ];
  then
source $PRE/dotfiles/zsh/nix/env.sh
source $PRE/dotfiles/zsh/nix/config.sh
source $PRE/dotfiles/zsh/nix/aliases.sh 
fi

