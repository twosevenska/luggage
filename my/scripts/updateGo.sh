#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldorange=${bold}$(tput setaf 202) #  red
bldblue=${bold}$(tput setaf 045) #  blue

GO_VERSION=1.8.1

clear

echo -e "${bldblue}Athena is online and ready to update the Gophers${normal}"

while :
do
	echo -e "${bldblue}Do you wish to update to version ${bldorange}$GO_VERSION? (Y/n)${normal}"
	read yn
	case $yn in
		n)
      echo "${bldblue}Type the version you wish, followed by [ENTER]:${normal}"
      read GO_VERSION
		*)
      # Install GO
      if [ -d "go$GO_VERSION.linux-amd64.tar.gz" ]; then
        echo "${bldblue}Found old download, removing it${normal}"
        rm -rf go$GO_VERSION.linux-amd64.tar.gz
      fi
      echo "${bldblue} Downloading go$GO_VERSION.linux-amd64.tar.gz${normal}"
      wget –quiet https://storage.googleapis.com/golang/go$GO_VERSION.linux-amd64.tar.gz
      if [ -d "/usr/local/go" ]; then
        echo "${bldblue}Removing old version${normal}"
        sudo rm -rf /usr/local/go
      fi
      echo "${bldblue}Unpacking go language${normal}"
      sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
      rm -rf go$GO_VERSION.linux-amd64.tar.gz
			break
			;;
	esac

	echo -e "${bldblue}Please add the following lines to your shell configuration file:${normal}"
	echo -e "${bldblue}# Golang variables${normal}"
	echo -e "${bldblue}export GOPATH=/repos/go${normal}"
	echo -e "${bldblue}export PATH=/usr/local/go/bin:\$PATH:\$GOPATH/bin${normal}"
done
