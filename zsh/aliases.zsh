# ============================================================================
# << ALIAS INBOX >>
# These get added as they come to me.  If I end up continuing to use them,
# they'll be grouped together / moved to a more appropriate place.
# ============================================================================
alias c="cd"
alias fv="fzf | xargs nvim"
alias dt="dots"
alias dts="dots status"
alias bs="brew -S"
alias ql-reset="qlmanage cache -r && qlmanage -r"
alias pac="nvim package.json"
alias glb="git_list_branches"
alias jiracl="node /usr/local/lib/node_modules/jira-cl/lib/index.js"
alias brewup="brew update; brew upgrade; brew prune; brew cleanup; brew doctor;"
alias npmup="ncu -u -a"
alias gh="cd ~/github"
alias dev="cd ~/dev"
alias yrd="yarn run dev"
alias nrd="npm run dev"
alias grba="git rebase --abort"
alias webdev="CLIENT_ONLY=true API_ENV=dev npm run dev"
alias webqa="CLIENT_ONLY=true API_ENV=qa npm run dev"
alias pop="git stash pop"
alias gl="git log"
alias cat="vimcat"
alias grhh="git add -u && git reset --hard HEAD"
alias w="nvim ~/vimwiki/index.wiki"
alias ck="chromekill"
alias vidc="vi docker-compose.yml"
alias vid="vi Dockerfile"
alias chex"chmod +x"
alias bi="brew info"
alias vp="vim package.json"
alias yad="yarn add"
alias yadd="yarn add -D"
alias lint="yarn lint"

# Grails
alias gr="yes | grails run-app"
alias kg="ps -efw | ag '[g]rails' | awk '{print $2}' | xargs kill"
alias grl="ps -efw | ag '[g]rails'"

# Misc
alias npmig="npm install -g"
alias nig="npm install -g"
alias yga="yarn global add"
alias ap="ansible-playbook"
alias atom="atom-beta"
alias dots="git --git-dir=\"$HOME\"/.dotfiles --work-tree=\"$HOME\""
alias fuck='eval $(thefuck $(fc -ln -1))'
alias kbz="ps -efw | ag 'bz' | awk '{print $2}' | sudo xargs kill"
alias lessme="less README.md"
alias nv="nvim"
alias tf="terraform"
alias tmd="tmux detach"
alias bw="brew"
alias bws="brew -S"
alias bwi="brew install"

# Display human-readable size of each child directory.
alias d1="du -h -d 1"
# List folders in directory, and sort by size.
alias d1s="du -d 1 -k . | sort -n"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"
alias rl="exec $SHELL -l"

# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\n} | sort'

alias sz="source ~/.zshrc"
alias z="source ~/.zshrc"

#--------------------------------------
# Alias `ls` to use `exa`.
#--------------------------------------
# List all files colorized in long format
alias l="exa -l"
# List all files colorized in long format, including dot files
alias la="exa -la --git-ignore --group-directories-first"
alias laa="exa -la --group-directories-first"
# List only directories
alias lsd="exa -d"
# Always use color output for `ls`
alias ls="exa"
# List sorted by date.
alias lasd="exa -la -s date"

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

# Enable aliases to be sudo’ed
alias sudo='sudo '

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
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc";
[ -e "${jscbin}" ] && alias jsc="${jscbin}";
unset jscbin;

# Trim new lines and copy to clipboard
# alias c="tr -d '\n' | pbcopy"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

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
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias freewifi="sudo ifconfig en0 ether `openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'`"

alias gad='git add --all .'
alias gag='git add . && git commit --amend --no-edit && git push -f'
alias gbc='gdc'
alias gca='git commit -a'
alias gcaa='git commit -a --amend -C HEAD'
alias gcl='git clone'
alias gcm="git commit -m"
alias gco='git checkout'
alias gd='git diff'
alias gdc='git diff --cached'
alias gdm='git diff master'
alias gg='git lg'
alias gom-done="git-on-master && gpf && git-done"
alias gp='git push'
alias gpf='git push -f'
alias gpr='git pull --rebase'
alias gpush='echo "Use gp!" && git push'
alias grc='git rebase --continue'
alias sync='git add -u . && git commit -m "[commit message automatically skipped]" && repush'
alias h='sync'
alias hpr='hub pull-request'
alias repush="gpr && git push"
alias retag='ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp *'
alias review="git diff master"
alias track='git checkout -t'
alias gwip='git add -u . && git commit -m "[commit message skipped]" && repush'

alias dt-sync='dots add -u . && dots commit -m "[commit message skipped]" && dots push origin'
