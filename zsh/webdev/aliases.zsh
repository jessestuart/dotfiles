#!/usr/bin/env zsh
# ============================
# Web dev -- Yarn / NPM / etc.
# ============================

alias cra="create-react-app"
alias deps="yarn update; git add -A; gcm '[deps] Bump dependencies.'"
# alias nig="npm i -g"
alias npmig="npm install -g"
alias ns="npm show"
alias pac="$EDITOR package.json"
alias pacup="ncu -ua"

# Meh.
alias nr="npm run"
alias nrd="npm run dev"
alias nrt="npm run test"

### Yarn shortcuts.

alias build="yarn build"
alias dev="yarn dev"
alias jw="yarn jest --watch"
alias lint="yarn lint"
alias nig="yarn global add"
alias y="yarn"
alias yad="yarn add -E"
alias yadd="yarn add -E -D"
alias yag="yarn global add"
alias yga="yarn global add"
alias yl="yarn lint"
alias ysr="yarn start --reset-cache"
alias yt="yarn test"
alias ywip="yarn willitpass"

# Gatsby
alias killgat="ps -efw | ag '[g]atsby develop' | awk '{print $2}' | xargs kill"
