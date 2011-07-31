#!/bin/bash

zed_X="echo -ne \e]1;$1\a"

#print variable on a screen
$zed_X
