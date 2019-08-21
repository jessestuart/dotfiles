#!/usr/bin/env zsh
# ============================
# Web dev -- Yarn / NPM / etc.
# ============================

alias build="yarn build"
alias cra="create-react-app"
alias deps="yarn update; git add -A; gcm '[deps] Bump dependencies.'"
alias dev="yarn dev"
alias lint="yarn lint"
alias nig="yarn global add"
# alias nig="npm i -g"
alias yag="yarn global add"
alias npmig="npm install -g"
alias nr="npm run"
alias nrd="npm run dev"
alias nrt="npm run test"
alias pac="$EDITOR package.json"
alias pacup="ncu -ua"

# alias y="npm i"
# alias yad="npm install --save-exact"
# alias yadd="npm install --save-dev --save-exact"
# alias yl="npm run lint"
# alias yt="npm run test"

alias y="yarn"
alias yad="yarn add -E"
alias yadd="yarn add -E -D"
alias yga="yarn global add"
alias yl="yarn lint"
alias yt="yarn test"

alias ywip="yarn willitpass"
alias ysr="yarn start --reset-cache"
alias ytw="yarn test --watch"

# Gatsby
alias killgat="ps -efw | ag '[g]atsby develop' | awk '{print $2}' | xargs kill"
