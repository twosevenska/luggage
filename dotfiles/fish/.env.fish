# Setup Workspace
set -x WORKSPACE /repos

# Golang variables
if test -e "$WORKSPACE/go"
    switch (uname)
    case Linux
        set -x -U GOROOT /usr/local/go
        set -x -U GOPATH $WORKSPACE/go
        set -x -U GOBIN $GOPATH/bin 
        set PATH $PATH $GOROOT/bin $GOBIN
    case Darwin
        set -x -U GOROOT /usr/local/opt/go/libexec/bin
    end
end