# Aliases
alias work-ls='ls $WORKDIR/go/src/'

# Golang Aliases
alias gconvey='$GOPATH/bin/goconvey -host="0.0.0.0"'

# Functions
work() { cd "$WORKDIR/go/src/$@"; }
