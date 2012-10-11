#!/bin/zsh

unamestr=`uname`

export ZSH=$PRE/dotfiles/zsh/oh-my-zsh
export ZSH_CUSTOM=$PRE/dotfiles/zsh/oh-my-zsh-custom
export ZSH_THEME="weatherby"
export DISABLE_AUTO_UPDATE="true"
export DISABLE_AUTO_TITLE="true"

plugins=(git rails3 rvm ruby osx heroku github brew gem gnu-utils node npm redis-cli)

source $ZSH/oh-my-zsh.sh

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

