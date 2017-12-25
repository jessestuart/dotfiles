#!/bin/bash
if [ "$(uname)" = 'Darwin' ]; then
  # Golang
  export GOPATH="$HOME/go"
  export GOROOT="/usr/local/opt/go/libexec"
  export PATH="$PATH:/usr/local/opt/go/libexec/bin"
  export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
  export PATH="$PATH:$GOROOT/bin"
fi
