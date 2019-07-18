#!/usr/bin/env zsh

alias ck="chromekill"
alias dkut="diskutil"
alias dkute="diskutil eject"
alias dkutl="diskutil list"
alias etcher="sudo etcher"
alias ql-reset="qlmanage cache -r && qlmanage -r"
alias toggle-app="osascript ~/dotfiles/bin/toggle-app.applescript "

# =============================================================================
# =============================================================================

# Enable/Disable Spotlight
alias spotoff="sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"
alias spoton="sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.metadata.mds.plist"

# Enable/Disable Time Machine throttling
alias tmup="sudo sysctl debug.lowpri_throttle_enabled=0"
alias tmdown="sudo sysctl debug.lowpri_throttle_enabled=1"

# Clean up LaunchServices to remove duplicates in the “Open With” menu
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

# JavaScriptCore REPL
jscbin="/System/Library/Frameworks/JavaScriptCore.framework/Versions/A/Resources/jsc"
[ -e "$jscbin" ] && alias jsc="$jscbin"
unset jscbin

# Show/hide hidden files in Finder
alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

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

# Kill all the tabs in Chrome to free up memory.
# @see http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias chromekill="ps ux | grep '[C]hrome Helper (Renderer)' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"
# alias chromiumkill="ps ux | grep '[C]hromium Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession -suspend"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
