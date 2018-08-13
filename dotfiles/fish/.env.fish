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

# Pyenv variables
if test -e "~/.pyenv"
    switch (uname)
    case Linux
        set PATH "~/.pyenv/bin" $PATH
        set -x PYENV_ROOT $HOME/.pyenv
        set -x PATH $PYENV_ROOT/bin $PATH
        set -x PATH $HOME/.pyenv/shims $PATH
    end
end

# NVM function
function nvm
    bass source /usr/local/opt/nvm/nvm.sh --no-use ';' nvm $argv
end