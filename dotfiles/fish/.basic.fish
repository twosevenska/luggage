# Setup shell to use 256 colors
set -x -g TERM "xterm-256color"

switch (uname)
case Darwin
    # Give priority to the Homebrew installations
	if test -e "/usr/local/bin";
		set -x PATH /usr/local/bin $PATH
	end

	# Give priority to the Homebrew installations
	if test -e "/usr/local/sbin";
		set -x PATH /usr/local/sbin $PATH
	end
end