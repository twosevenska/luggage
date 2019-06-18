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

echo -e "${bldgree}Installing fish${normal}"
apt-add-repository ppa:fish-shell/release-2
apt-get update
apt-get install fish
echo -e "${bldred}To use fish as your default shell, use the following command:${normal}"
echo -e "chsh $USER -s $(which fish)"
echo -e "${bldred}If it fails try to edit '/etc/passwd' directly${normal}"

echo -e "${bldgree}Updating gitand related utils${normal}"
add-apt-repository ppa:git-core/ppa -y
apt-get update
apt-get install git tig -y

echo -e "${bldgree}Installing fisher${normal}"
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish