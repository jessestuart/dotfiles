#!/usr/bin/env zsh

# =============================
# < I alias all the things. >>
# =============================
# << A PRELUDE >>
# Sometimes I work on systems that don't have neovim. I know, right?
# Provide a fallback here so $EDITOR aliases still work.
load_editor

# ============================================================================
# << ALIAS INBOX >>
# These get added as they come to me. If I end up continuing to use them,
# they'll be grouped together / moved to a more appropriate place.
# ============================================================================
alias chex="chmod +x"
alias cl="clear && pwd && la"
alias clobber="set +C"
alias count="wc -l"
alias -g .count="| wc -l"
# alias ctags="/usr/local/bin/ctags"
alias f="fzf | xargs $EDITOR"
alias lrd="login_restic_do"
alias lrdo="login_restic_do"
alias net="netlifyctl"
alias org="cd ~/Dropbox/org"
alias tfa="terraform apply tf.plan"
alias tfp="terraform plan -out tf.plan"
alias today="nvim ~/Dropbox/org/$(date -u +"%Y%m%d").md"
alias jd="cd $HOME/dotfiles"
alias V="cd /Volumes"
alias scid="ssh-copy-id"
alias gojira="~/go/bin/jira"
alias dfh="df -h"
alias cci="circleci "
alias orb="circleci orb "
alias ys="yarn -s"
alias fl="bundle exec fastlane"
alias jv="load_sdkman"
alias scli="sentry-cli"
alias sim="open /Applications/Xcode.app/Contents/Developer/Applications/Simulator.app"
alias e2e="yarn e2e"
alias simctl="xcrun simctl"
alias pip="pip3"
alias curl="curl -sL"
alias vel="velero"
# alias ssh="mosh"
alias px="ps aux"
alias jgh="cd ~/github"
alias n="nnn"
alias bd="brew desc"
alias xsh="xpanes --ssh"
alias mp="sudo multipass"
alias si="sudo -i"
alias ar2="aria2c"
alias gil="gitin log"
alias hass="hass-cli"
alias jsown="sudo chown -R jesse:"
alias pb64="pbpaste | base64 -d"
alias ydl="youtube-dl"
alias fmap="for file in "
alias prefs="open /System/Applications/System\ Preferences.app"
# alias antibody-sh="antibody bundle < ~/.zsh/antibody.conf > ~/.zsh/antibody.sh"

alias dns-cf="m network location switch cloudflare"
alias dns-ag="m network location switch adguard"

alias zpga="zpool get all "
alias zga="zfs get all "

alias tl="sudo tail -n100 -f "

alias -g sk1="| sort -k1"
alias -g sk2="| sort -k2"
alias -g sk3="| sort -k3"
alias -g .s="| sort "
alias -g .r="| rg "
alias -g R="| rg -i "
alias -g .rv="| rg -v "
alias -g .jq="| jq "

alias psrg="ps aux | rgi"

alias scratch='cd $(mktemp -d)'
alias scr='cd $(mktemp -d)'

alias -g xi="| xargs -I{} "
alias -g .x="| xargs "
alias -g ,,="| "
alias cd.="eval 'cd !$'"

function ports() {
  # netstat -plunt | \
  netstat -f inet -a |

  grep LISTEN |
    grep tcp4 |
    sed -E 's/\s+/|/g' |
    sed -e 's/127\.0\.0\.1//g' -e 's/0\.0\.0\.0//g' -e 's/://g' |
    awk -F '|' '{print $4,$7}' |
    sort -k1n |
    column -t
}

function cheat() {
  if $(echo $1 | grep -q '\.man$'); then
    \cat $1 | nvim -R
  fi
  /usr/local/bin/cheat $1 | bat -p --theme TwoDark --language=md
}

function hosts() {
  sudo $EDITOR /etc/hosts
}

if test -e $HOME/.config/ignore; then
  alias rg="rg --ignore-file=$HOME/.config/ignore"
fi
alias rgi="rg -i"
alias rgh="rg --hidden"
alias rghig="rg --hidden --no-ignore"
alias rgig="rg --no-ignore"
alias rgf="rg --files-with-matches"
alias rgconsole="rg -g '!tslint.json' console"

function sum() {
  sum=0
  while read i; do sum=$(($sum + $i)); done
  echo $sum
}

# alias emacs="TERM=xterm-24bit /usr/local/bin/emacs -nw"

# *Advanced SSH Config* --
# @see https://github.com/moul/advanced-ssh-config
alias ash="clobber && assh config build > ~/.ssh/config"
alias vash='$EDITOR ~/.ssh/assh.yml'

# ============================================
# Shell essentials. `ls`, `du`, `source`, etc.
# ============================================
# Display human-readable size of each child directory.
alias d1="du -h -d 1"
# List folders in directory, and sort by size.
alias d1s="du -d 1 -k . | sort -n"

# Reload the shell (i.e. invoke as a login shell)
alias rl="exec $SHELL -l"
alias sz="source ~/.zshrc"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n} | sort'

# Enable aliases to be sudo’ed.
alias sudo='sudo '

if [ "$(uname)" = 'Darwin' ]; then
  function rm() {
    if hash trash-put &>/dev/null; then
      trash-put "$@"
    else
      mv "$@" ~/.Trash/
    fi
  }
fi

if (hash bat &>/dev/null); then
  # alias cat='bat --theme OneHalfDark --pager "less -RF"'
  alias cat='bat --theme OneHalfDark'
elif (hash ccat &>/dev/null); then
  alias cat="ccat"
fi

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# ==========
# Flush DNS.
# ==========
alias fdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

#--------------------------------------
# << LISTING THINGS! >>
# Alias `ls` to use `exa`. If it exists.
#--------------------------------------
if hash exa &>/dev/null; then
  alias ls="exa --git --group-directories-first --git-ignore --color-scale --time-style=iso"
  # List all files colorized in long format, including dot files
  alias la="exa -l --git --group-directories-first --git-ignore --color-scale --time-style=iso"
  alias ll="la"
  # Same as above, but don't hide gitignored files.
  alias laa="exa -la --git --group-directories-first --color-scale --time-style=iso"
  alias a="laa"
  # List all sorted by size.
  alias las="la -s size --git"
  # List all sorted by date.
  alias lad="la -s date --git"
  # List only directories.
  alias ladir="exa -d --git"
  # Sometimes I button-mash.
  alias lka="la"
  alias lat="la --tree"
  alias lst="ls --tree"
else
  alias ls="ls --color --group-directories-first"
  alias ll="ls -lh"
  alias la="ls -alh"
  alias laa="ls -alh"
fi

# Misc
alias ap="ansible-playbook"
alias atom="atom-beta"
alias cuck='eval $(thefuck $(fc -ln -1))'
alias kbz="ps aux | grep '[B]ackblaze' -i | awk2 | sudo xargs kill -9"
alias tf="terraform"
alias tmd="tmux detach"

# ===================================================

# Get week number
alias week='date +%V'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }' | sort -nr"
alias ip4="ifconfig -a | grep -o 'inet\s\(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet\s(addr:)? ?/, \"\"); print }' | sort -nr"

# Show active network interfaces
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Flush Directory Service cache
alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en0' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en0 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Canonical hex dump; some systems have this symlinked
command -v hd >/dev/null || alias hd="hexdump -C"

# macOS has no `md5sum`, so use `md5` as a fallback
command -v md5sum >/dev/null || alias md5sum="md5"

# macOS has no `sha1sum`, so use `shasum` as a fallback
command -v sha1sum >/dev/null || alias sha1sum="shasum"

alias myip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Trim new lines and copy to clipboard
# alias c="tr -d '\n' | pbcopy"

# URL-encode strings
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1]);"'

# Ring the terminal bell, and put a badge on Terminal.app’s Dock icon
# (useful when executing time-consuming commands)
alias badge="tput bel"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
# alias map="xargs -n1"

# One of @janmoesen’s ProTip™s
for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do
  alias "$method"="lwp-request -m '$method'"
done

alias freewifi="sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')"

alias awk1="awk '{print \$1}'"
alias awk2="awk '{print \$2}'"
alias awk3="awk '{print \$3}'"
alias awk4="awk '{print \$4}'"
alias awk5="awk '{print \$5}'"
alias awk6="awk '{print \$6}'"
alias awk7="awk '{print \$7}'"
alias awk8="awk '{print \$8}'"
alias awk9="awk '{print \$9}'"
alias awk10="awk '{print \$10}'"
alias awk11="awk '{print \$11}'"
alias awk1,2="awk '{print \$1,\$2}'"

# Allow alias expansion for `watch` command.
alias watch="watch --color "

# if hash ncdu &>/dev/null; then
#   alias du="ncdu --color dark -rr -x"
# fi
