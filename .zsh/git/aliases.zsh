# Git aliases -- because who needs GUIs when
alias g="git"
alias gacam="git add -u && git cam"
alias gacm="git add -A && gcm"
alias god="git checkout develop && git pull"
alias gom="git checkout master && git pull"
alias gpf="git push -f"
alias gs="git status"
alias gup="git pull"
alias lg="legit"
alias pull="hub pull"
alias push="hub push"
alias rbid="git rebase -i develop"
alias rbim="git rebase -i master"
function gacmp() {
  if [[ "$#" == 0 ]]; then
    echo "Git commit message required."
  fi
  git add -A
  git commit -m $1
  git push origin
}
alias gci="hub ci-status -v"
alias hubci="hub ci-status -v"
alias git-cleanup-merged-prs="git fetch --prune; git branch -r --merged | grep origin | grep -v '>' | grep -v master | grep -v develop | xargs -L1 | awk '{sub(/origin\//,"");print}' | xargs git push origin --delete"
