# Setup Workspace
set -x WORKSPACE /repos

# Golang variables
if test -e "$WORKSPACE/go"
    switch (uname)
    case Linux
        set -x -U GOROOT /usr/local/go
        set -x -U GOPATH $WORKSPACE/go
        set PATH $PATH $GOROOT/bin $GOPATH/bin 
    case Darwin
        set -x -U GOROOT /usr/local/opt/go/libexec
        set -x -U GOPATH $WORKSPACE/go
        set PATH $PATH $GOROOT/bin $GOPATH/bin 
    end
end