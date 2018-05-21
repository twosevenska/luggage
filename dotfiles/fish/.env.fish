# Setup Workspace
set -x WORKSPACE /repos

# Golang variables
if test -e "$WORKSPACE/go";
	set -x GOPATH $WORKSPACE/go
    set -x PATH $PATH /usr/local/opt/go/libexec/bin $GOPATH/bin
end