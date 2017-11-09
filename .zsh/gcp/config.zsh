export GCP_ROOT='/usr/local/share/gcp/'

function loadGCP() {
  [[ -f /usr/local/share/gcp/path.zsh.inc ]] && . "/usr/local/share/gcp/path.zsh.inc"
  [[ -f /usr/local/share/gcp/completion.zsh.inc ]] && . "/usr/local/share/gcp/completion.zsh.inc"
}

async loadGCP
