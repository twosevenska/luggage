#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldorange=${bold}$(tput setaf 202) #  red
bldblue=${bold}$(tput setaf 045) #  blue

GO_VERSION=1.8.1
WORKFOLDER=~/Work

function perform_Update {
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
}

function ask_Update {
	echo -e "${bldblue}Do you wish to update to version ${bldorange}$GO_VERSION? (Y/n/change)${normal}"
	read yn
	case $yn in
		n)
			return
			;;
		change)
	    echo "${bldblue}Type the version you wish, followed by [ENTER]:${normal}"
	    read GO_VERSION
			perform_Update
			;;
		*)
			perform_Update
			;;
	esac
}

function create_Workplace {
	echo -e "${bldblue}Creating workspace at: ${bldorange}$WORKFOLDER${normal}"
	if [ ! -d "$WORKFOLDER" ]; then
		mkdir $WORKFOLDER
	fi
	mkdir $WORKFOLDER/go/ $WORKFOLDER/go/src $WORKFOLDER/go/bin $WORKFOLDER/go/pkg
}

function ask_Workplace {
	if [ ! -d "$WORKFOLDER/go" ]; then
		echo -e "${bldblue}Default workspace: ${bldorange}$WORKFOLDER${normal}"
		echo -e "${bldblue}Do you wish to change? (y/N)${normal}"
		read yn2
		case $yn2 in
			y)
	      echo "${bldblue}Type the version you wish, followed by [ENTER]:${normal}"
	      read WORKFOLDER
				create_Workplace
				;;
			*)
				create_Workplace
				;;
		esac
	fi
}

clear
echo -e "${bldblue}Athena is online and ready to update the Gophers${normal}"
ask_Update
ask_Workplace
echo -e "${bldblue}Please add the following lines to your shell configuration file:${normal}"
echo -e "${bldblue}# Golang variables${normal}"
echo -e "${bldblue}export GOPATH=$WORKFOLDERk/go${normal}"
echo -e "${bldblue}export PATH=/usr/local/go/bin:\$PATH:\$GOPATH/bin${normal}"
