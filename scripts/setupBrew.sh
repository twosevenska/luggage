#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldorange=${bold}$(tput setaf 202) #  red
bldorange=${bold}$(tput setaf 214) #  orange

clear
echo -e "${bldorange}I BRING PANDAMONIUM!!!!!${normal}"
echo -e "${bldorange}Setting up Homebrew!${normal}"

# Install brew basics (auto-updating)
brew install terminal-notifier
brew tap domt4/autoupdate
brew autoupdate --start --upgrade --cleanup --enable-notifications

# Install VM/Deploy tools
brew install caskroom/cask/virtualbox
brew install ansible
brew install docker

# Install Git stuff
brew install git
brew install tig

# Install FANCY shell stuff
brew cask install iterm2
brew install fish
brew install tmux
brew install jq
brew tap caskroom/fonts
brew cask install font-droidsansmono-nerd-font-mono

# Install download utilities
brew install wget
brew install httpie

# Install Python utlitlies
brew install pipenv
brew install pyenv

# Install Node utlitlies
brew install nvm

# Install Golang utlitlies
brew install go
brew install dep
brew install glide

# Install Network utlitlies
brew install wireshark --with-qt

# Code building libraries
brew install librdkafka

# List of items to check if leftovers mistakenly identified as leaves
#gobject-introspection
#jemalloc
#librsvg
#libtermkey
#libtool
#libuv
#libvterm
#libxslt
#luajit
#msgpack
#shared-mime-info
#unibilium

echo -e "${bldorange}ANOTHER ROUND!${normal}"