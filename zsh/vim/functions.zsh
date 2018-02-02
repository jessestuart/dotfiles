#!/bin/zsh
function vim_profile_startup() {
  nvim --cmd 'profile start profile.log' \
    --cmd 'profile func *' \
    --cmd 'profile file *' \
    -c 'profdel func *' \
    -c 'profdel file *' \
    -c 'qa!'
}

function rgv() {
  rg --files-with-matches $1 | xargs $EDITOR
}
