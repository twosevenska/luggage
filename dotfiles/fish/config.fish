source ~/luggage/dotfiles/fish/.basic.fish
source ~/luggage/dotfiles/fish/.alias.fish
source ~/luggage/dotfiles/fish/.env.fish

# Loads Work related extras if symlink for repo is found
if test -d ~/luggageHF
    source ~/luggageHF/dotfiles/fish/.extra.fish
end

# Loads any system especific configs and potentially overwrite previous stuff
if test -e ~/.extras.fish
    source ~/.extras.fish
end