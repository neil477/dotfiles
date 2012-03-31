#!/bin/bash

unamestr=`uname`

if [ "$(uname)" = 'Darwin' ];
  then
    cmd='/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n '$1
else
    cmd='emacsclient -n '$1
fi

$cmd&
