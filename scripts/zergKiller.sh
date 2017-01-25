#!/bin/bash

# Try to use awk to get the pid values and autorun the kill command

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldred=${bold}$(tput setaf 1) #  red

clear

echo -e "${bldred}May your death be swift.${normal}"

ps aux | grep hive-mind.go
sudo lsof -i :8010 | grep LISTEN

echo -e "Please check the PID related to hivemind and run: ${bold}kill ${underline} PID ${normal}"




