# Add the bins.
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH='/usr/local/sbin':$PATH

# Couple special `bin` directories for [dash](https://github.com/IFTTT/dash)
# + some nifty commands from [Zach Holman](https://github.com/holman/dotfiles)
export PATH="$HOME/bin/dash:$PATH"
export PATH="$HOME/bin/holman:$PATH"

# Golang
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH="$PATH:$GOPATH/bin:$GOROOT/bin"
export PATH=$PATH:$GOROOT/bin

# MongoDB
export MONGO_PATH=/usr/local/mongodb
export PATH=$PATH:$MONGO_PATH/bin

# Python.
export PATH="/usr/local/opt/python/libexec/bin:$PATH"

# Ruby.
export PATH="/Users/jesse/.gem/ruby/2.3.0/bin:$PATH"

export PATH="$PATH:/usr/local/opt/yarn/bin"

export PATH="$PATH:~/dotfiles/**/*.sh"

# ~* Secrets *~
if [[ -a ~/.secrets ]]; then source ~/.secrets; fi
