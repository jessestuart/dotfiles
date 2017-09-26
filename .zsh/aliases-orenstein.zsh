# Handle the fact that this file will be used with multiple OSs
platform=`uname`
if [[ $platform == 'Linux' ]]; then
  alias a='ls -lrth --color'
elif [[ $platform == 'Darwin' ]]; then
  alias a='ls -lrthG'
fi

# alias -g G='| grep'
# alias -g L='| less'
# alias -g M='| more'
alias amend="git commit --amend"

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
alias gs='git show'
alias sync='git add -u . && git commit -m "Minor changes. Commit message skipped." && repush'
alias h='sync'
alias hpr='hub pull-request'
alias repush="gpr && git push"
alias retag='ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp *'
alias review="git diff master"
alias track='git checkout -t'
# alias m='git checkout master'
alias dt-sync='dots add -u . && dots commit -m "Minor changes. Commit message skipped." && dots push origin'

alias gwip='git add -u . && git commit -m "[wip]" && repush'

alias newscreen="tmux"
alias trs='tmux rename-session'

alias sfh='cd ~/code/speaking-for-hackers-book'
alias drop='cd ~/Dropbox'

alias start='vim ~/Dropbox/work/thoughtbot/notes/day-start-checklist.md'
alias status='vim ~/Dropbox/work/thoughtbot/notes/upcase -c "Ex"'
alias worknotes='vim ~/Dropbox/work/thoughtbot/notes -c "Ex"'
# alias t='cd ~/code/trailmix'
alias u='cd ..'
alias unslack='sudo cp /etc/hosts-with-timewasters-blocked.txt /etc/hosts'

