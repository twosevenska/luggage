# Aliases
alias work-ls='ls $WORKDIR/go/src/'

# Tmux aliases
alias ta="tmux attach -t"
alias tnew="tmux new -s"

# Golang Aliases
alias gconvey='$GOPATH/bin/goconvey -host="0.0.0.0"'

# Functions
work() { cd "$WORKDIR/go/src/$@"; }
