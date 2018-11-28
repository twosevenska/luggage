#!/bin/bash

# General setup just to make things look pretty and nerdy
bold=$(tput bold)
underline=$(tput smul)
normal=$(tput sgr0)
bldred=${bold}$(tput setaf 1) #  red
bldgreen=${bold}$(tput setaf 2) #  green

# The actual meat of the script

if [ -d ~/.config/fish ]; then
    if [ -f ~/.config/fish/config.fish ]; then
        cp ~/luggage/dotfiles/fish/config.fish ~/.config/fish/config.fish
    else
        ln -sf ~/luggage/dotfiles/fish/config.fish ~/.config/fish/config.fish
    fi

    if [ -f ~/.config/fish/fishfile ]; then
        cp ~/luggage/dotfiles/fish/fishfile ~/.config/fish/fishfile
    else
        ln -sf ~/luggage/dotfiles/fish/fishfile ~/.config/fish/fishfile
    fi
else
    echo -e "${bldgree}Fish does not seem to be ready!${normal}"
fi
