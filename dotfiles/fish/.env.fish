# Setup Workspace
set -g -x WORKSPACE /repos

# Golang variables
if test -e "$WORKSPACE/go"
    switch (uname)
        case Linux
            set -gx GOROOT /usr/local/go
            set -gx GOPATH $WORKSPACE/go
            set PATH $PATH $GOROOT/bin $GOPATH/bin
        case Darwin
            set -gx GOROOT /usr/local/opt/go/libexec
            set -gx GOPATH $WORKSPACE/go
            set PATH $PATH $GOROOT/bin $GOPATH/bin
    end
end

# NVM function
function nvm
    bass source /usr/local/opt/nvm/nvm.sh --no-use ';' nvm $argv
end

# Python stuff
# Don't write bytecode, Python!
export PYTHONDONTWRITEBYTECODE=1
export PIPENV_DEFAULT_PYTHON_VERSION=3.7
if [ "$TERM_PROGRAM" != "vscode" ]
    export PIPENV_SHELL_FANCY=1
end
export PIPENV_MAX_SUBPROCESS=32
