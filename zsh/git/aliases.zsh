# ======================================
# Git aliases -- because who needs GUIs?
# ======================================
alias g="git"
alias ga="git add -A"
alias gacam="git add -u && git cam"
alias gacm="git add -A && gcm"
alias gag="git add . && git commit --amend --no-edit && git push -f"
alias gas="git add -A && git status"
alias gca="git commit -a"
alias gcaa="git commit -a --amend -C HEAD"
alias gci="hub ci-status -v"
alias gcl="git clone"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gd="git diff --staged"
alias gd="git diff"
alias gdc="git diff --cached"
alias gdm="git diff master"
alias gds="git diff --staged"
alias ggo="git checkout -"
alias gh="cd ~/github"
alias gl="git log"
alias glb="git_list_branches"
alias god="git checkout develop && git pull"
alias gom="git checkout master && git pull"
alias gp="git push"
alias gpf="git push --force-with-lease"
alias gpf="git push -f"
alias gpr="git pull --rebase"
alias grba="git rebase --abort"
alias grc="git rebase --continue"
alias grhh="git add -u && git reset --hard HEAD"
alias gs="git status"
alias gst="git stash save"
alias gwip="git_push_work_in_progress"
alias hpr="hub pull-request"
alias hubci="hub ci-status -v"
alias lg="legit"
alias pop="git stash pop"
alias pu="git pull"
alias pull="git pull"
alias push="git push"
alias rbid="git rebase -i develop"
alias rbim="git rebase -i master"
alias repush="gpr && git push"
alias retag="ctags -R --exclude=.svn --exclude=.git --exclude=log --exclude=tmp *"
alias review="git diff master"
alias track="git checkout -t"

function gacp() {
  if [[ "$#" == 0 ]]; then
    echo "Git commit message required."
  fi
  git add -A
  git commit -m "$1"
  git push
}

function git_push_work_in_progress() {
  git add -u .
  git commit -m '[commit message skipped]'
  git push
}

function git_cleanup_merged_prs() {
  git fetch --prune
  git branch -r --merged | \
    grep origin | \
    grep -Ev 'master|develop|>' | \
    sed 's/origin\///g' | \
    xargs git push origin --delete
}
