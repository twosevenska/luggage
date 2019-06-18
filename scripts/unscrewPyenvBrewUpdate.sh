#!/usr/bin/env bash

#set -x

echo "Unscrewing the mess that brew update made on the pyenv shim files. Going from $1 to $2." 

sed -i -- "s/$1/$2/g" $PYENV_ROOT/shims/* 
