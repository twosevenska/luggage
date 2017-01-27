#!/bin/bash

# Sometimes hivemind can be naughty and if we lose connection to the VM it can
# actually keep on running. This script will hunt it down and kill it.

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldred=${bold}$(tput setaf 1) #  red

clear

echo -e "${bldred}May your death be swift.${normal}"

fuser -k 8010/tcp
