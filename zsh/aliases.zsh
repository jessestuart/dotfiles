#!/usr/bin/env bash
# =============================
# << I ALIAS ALL THE THINGS. >>
# =============================

# << A PRELUDE >>
# Sometimes I work on systems that don't have neovim. I know, right?
# Provide a fallback here so the aliases still work.
if (hash nvim &>/dev/null); then
  export EDITOR='nvim'
elif (hash vim &>/dev/null); then
  export EDITOR='vim'
else
  export EDITOR='vi'
fi

# ============================================================================
# << ALIAS INBOX >>
# These get added as they come to me. If I end up continuing to use them,
# they'll be grouped together / moved to a more appropriate place.
# ============================================================================
alias c="cd"
alias chex="chmod +x"
alias ck="chromekill"
alias f="fzf | xargs $EDITOR"
alias jiracl="node /usr/local/lib/node_modules/jira-cl/lib/index.js"
alias ql-reset="qlmanage cache -r && qlmanage -r"
alias w="$EDITOR ~/vimwiki/index.wiki"
alias r="ranger"
alias viagit="$EDITOR ~/.zsh/git/aliases.zsh"
alias gitter="gitter-cli"
alias vissh="$EDITOR ~/.ssh/config"
alias today="$EDITOR ~/org/$(date -u +"%Y%m%d").org"
alias fb="messer"
alias h="hyper"
alias hc="hyper compose"
alias hcup="hyper compose up"
alias hcdown="hyper compose down"
alias clobber="set +C"
alias net="netlifyctl"
alias hcp="hub create -p"
alias vimake="$EDITOR Makefile"
alias lrdo="login_restic_do"
alias tfp="terraform plan -out tf.plan"
alias tfa="terraform apply tf.plan"
alias lrd="login_restic_do"

alias emacs="TERM='xterm-24bit' $HOME/github/emacs/src/emacs -nw"

# *Advanced SSH Config* --
# @see https://github.com/moul/advanced-ssh-config
# alias ssh="assh wrapper ssh"
alias vash="$EDITOR ~/.ssh/assh.yml"
alias ashup="assh config build > ~/.ssh/config"

function swap() {
  local file1=$1
  local file2=$2
  mv "$file1" "$file1.bak"
  mv "$file2" "$file1"
  mv "$file1.bak" "$file2"
}

if [ "$(uname)" = 'Darwin' ]; then
  function rm() {
    if hash trash&>/dev/null; then
      trash "$@"
    else
      rm "$@"
    fi
  }
fi

# ============================================
# Shell essentials. `ls`, `du`, `source`, etc.
# ============================================
# Display human-readable size of each child directory.
alias d1="du -h -d 1"
# List folders in directory, and sort by size.
alias d1s="du -d 1 -k . | sort -n"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
alias rl=reload
alias sz="source ~/.zshrc"
alias z="source ~/.zshrc"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n} | sort'

# Enable aliases to be sudo’ed.
alias sudo='sudo '

if (hash vimcat&>/dev/null); then alias cat="vimcat"; fi

#--------------------------------------
# << LISTING THINGS! >>
# Alias `ls` to use `exa`. If it exists.
#--------------------------------------
if (hash exa &>/dev/null); then
  alias ls="exa --git"
  # List all files colorized in long format
  alias l="exa -l --git"
  # List all files colorized in long format, including dot files
  alias la="exa -la --git --git-ignore --group-directories-first --color-scale"
  # Same as above, but don't hide gitignored files.
  alias laa="exa -la --git --group-directories-first"
  # List all sorted by size.
  alias las="la -s size --git"
  # List all sorted by date.
  alias lad="la -s date --git"
  # List only directories.
  alias ladir="exa -d --git"
  # Sometimes I button-mash.
  alias lka="la"
else
  alias ll="ls -l"
  alias la="ls -al"
fi

# =================
# Yarn / NPM / etc.
# =================
alias build="yarn build"
alias dev="yarn dev"
alias lint="yarn lint"
alias nig="npm install -g"
alias npmig="npm install -g"
alias nrd="npm run dev"
alias pac="$EDITOR package.json"
alias pacup="ncu -u -a"
alias yad="yarn add"
alias yadd="yarn add -D"
alias yga="yarn global add"

# Misc
alias ap="ansible-playbook"
alias atom="atom-beta"
alias fuck='eval $(thefuck $(fc -ln -1))'
alias kbz="ps -efw | ag 'bz' | awk '{print $2}' | sudo xargs kill"
alias tf="terraform"
alias tmd="tmux detach"

# Grails
alias gr="yes | grails run-app"
alias kg="ps -efw | ag '[g]rails' | awk '{print $2}' | xargs kill"
alias grl="ps -efw | ag '[g]rails'"

# ===================================================

# Enable/Disable Spotlight
alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"

# Enable/Disable Time Machine throttling
alias tmup="sudo sysctl debug.lowpri_throttle_enabled=0"
alias tmdown="sudo sysctl debug.lowpri_throttle_enabled=1"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd > /dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum > /dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum > /dev/null || alias sha1sum="shasum"

alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
[ -e "$jscbin" ] && alias jsc="$jscbin"
unset jscbin

# Trim new lines and copy to clipboard
# alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Merge PDF files
# Usage: `mergepdf -o output.pdf input{1,2,3}.pdf`
alias mergepdf='/System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py'

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# PlistBuddy alias, because sometimes `defaults` just doesn’t cut it
alias plistbuddy="/usr/libexec/PlistBuddy"

# Airport CLI alias
alias airport='/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

# Kill all the tabs in Chrome to free up memory.
# @see http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
alias chromiumkill="ps ux | grep '[C]hromium Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession -suspend"

alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"

alias man="viman"
