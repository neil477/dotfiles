#!/bin/zsh

unamestr=`uname`

export ZSH=$HOME/Dropbox/bin/dotfiles/zsh/oh-my-zsh
export ZSH_CUSTOM=$HOME/Dropbox/bin/dotfiles/zsh/oh-my-zsh-custom
export ZSH_THEME="weatherby"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"

plugins=(git rails3 rvm ruby osx heroku github brew gem gnu-utils node npm redis-cli)

source $ZSH/oh-my-zsh.sh

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

