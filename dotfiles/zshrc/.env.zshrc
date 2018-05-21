# Working Dir
export WORKDIR=/repos

# Golang variables
export GOPATH=$WORKDIR/go
export PATH=/usr/local/go/bin:$PATH:$GOPATH/bin

# Python variables

# Have pipenv use python3 by default
export PIPENV_DEFAULT_PYTHON_VERSION=3

# Pipenv autocompletion
eval "$(pipenv --completion)"