source ~/luggage/dotfiles/fish/.basic.fish
source ~/luggage/dotfiles/fish/.alias.fish
source ~/luggage/dotfiles/fish/.env.fish

# for things not checked into git..
if test -e "~/.extra.fish";
	source ~/.extra.fish
end