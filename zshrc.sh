#!/bin/bash

unamestr=`uname`

if [ "$(uname)" = 'Darwin' ];
  then
. ~/Dropbox/bin/dotfiles/zsh/osx/env.sh
. ~/Dropbox/bin/dotfiles/zsh/osx/config.sh
. ~/Dropbox/bin/dotfiles/zsh/osx/aliases.sh 
. ~/Dropbox/bin/dotfiles/scripts/
elif [ "$(uname)" = 'Linux' ];
  then
. ~/Dropbox/bin/dotfiles/zsh/nix/env.sh
. ~/Dropbox/bin/dotfiles/zsh/nix/config.sh
. ~/Dropbox/bin/dotfiles/zsh/nix/aliases.sh 
fi

