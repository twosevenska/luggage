#!/bin/bash

# !!!!!!!!!!!!!!!!!!!!!! NEVER RAN, TO BE TESTED !!!!!!!!!!!!!!!!!!!!

# Check if we are running as sudo
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

# General setup just to make things look pretty and nerdy
bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldred=${bold}$(tput setaf 1) #  red
bldgreen=${bold}$(tput setaf 2) #  green
clear

# The actual meat of the script
echo -e "${bldgree}Installing pyenv and python essentials${normal}"
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev