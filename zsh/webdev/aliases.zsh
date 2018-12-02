#!/usr/bin/env zsh
# ============================
# Web dev -- Yarn / NPM / etc.
# ============================

alias build="yarn build"
alias cra="create-react-app"
alias deps="yarn update; git add -A; gcm '[deps] Bump dependencies.'"
alias dev="yarn dev"
alias lint="yarn lint"
alias nig="npm install -g"
alias npmig="npm install -g"
alias nr="npm run"
alias nrd="npm run dev"
alias nrt="npm run test"
alias pac="$EDITOR package.json"
alias pacup="ncu -ua"
alias y="yarn"
alias yad="yarn add"
alias yadd="yarn add -D"
alias yga="yarn global add"
alias yl="yarn lint"
alias yt="yarn test"
alias ywip="yarn willitpass"
alias ysr="yarn start --reset-cache"

# Gatsby
# alias kg="ps -efw | ag '[g]atsby develop' | awk '{print $2}' | xargs kill"