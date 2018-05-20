# Setup Workspace
set -x WORKSPACE /repos

# Golang variables
set -x GOPATH $WORKSPACE/go
set -x PATH $PATH /usr/local/opt/go/libexec/bin $GOPATH/bin