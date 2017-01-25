#!/bin/bash

bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldred=${bold}$(tput setaf 1) #  red

clear

echo -e "${bldred}The Swarm prevails."
echo -e "----------------------------"
echo -e "!!!!!!! WARNING THIS SCRIPT MAY TAKE LONGER THAN YOU'D LIKE!${normal}"

echo -e "Do you wish to ${underline}shutdown${normal} the bespin stack and associated services?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) clear;cd /repos/env/deploy;bespin kill;shared-services kill; break;;
        No ) clear;;
    esac
done


echo -e "Do you wish to ${underline}update${normal} the bespin stack and associated services?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) clear;bespin -s 'Glass Trident Lobby Petros SwaggerUI Focus Blur Cocktail Zuul Babel Shinkansen' pull;shared-services pull; break;;
        No ) clear;;
    esac
done


echo -e "Do you wish to ${underline}start all${normal} of the bespin stack and associated services?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) shared-services up; bespin -s 'Glass Trident Lobby Petros SwaggerUI Focus Blur Cocktail Zuul Babel Shinkansen' up; break;;
        No ) exit;;
    esac
done


echo -e "Do you wish to start ${underline}NflexUI ${normal}?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) bespin -s NflexUI up; break;;
        No ) exit;;
    esac
done


