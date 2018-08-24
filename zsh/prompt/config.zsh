export SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  user          # Username section
  host          # Hostname section
  # package       # Package version
  # node          # Node.js section
  # ruby          # Ruby section
  # elixir        # Elixir section
  # golang        # Go section
  # rust          # Rust section
  # haskell       # Haskell Stack section
  docker        # Docker section
  # aws           # Amazon Web Services section
  # venv          # virtualenv section
  # conda         # conda virtualenv section
  # pyenv         # Pyenv section
  # kubecontext   # Kubectl context section
  exec_time     # Execution time
  battery       # Battery level and status
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

export SPACESHIP_RPROMPT_ORDER=(
  time          # Time stamps section
)

JS_SPACESHIP_GRAY='243'

export SPACESHIP_CHAR_PREFIX=''
export SPACESHIP_CHAR_SYMBOL='λ '
export SPACESHIP_CHAR_COLOR_SUCCESS='magenta'
export SPACESHIP_CHAR_COLOR_FAILURE='red'

export SPACESHIP_DIR_COLOR='blue'

export SPACESHIP_GIT_SYMBOL=''
export SPACESHIP_GIT_STATUS_COLOR=$JS_SPACESHIP_GRAY
export SPACESHIP_GIT_STATUS_PREFIX='['
export SPACESHIP_GIT_STATUS_SUFFIX=']'
export SPACESHIP_GIT_STATUS_STASHED=''
export SPACESHIP_GIT_STATUS_MODIFIED='*'
export SPACESHIP_GIT_STATUS_DELETED='-'
export SPACESHIP_GIT_STATUS_UNTRACKED=''

export SPACESHIP_GIT_BRANCH_COLOR=$JS_SPACESHIP_GRAY

export SPACESHIP_PROMPT_PREFIXES_SHOW=false

export SPACESHIP_DIR_TRUNC=0
export SPACESHIP_DIR_TRUNC_REPO=false

export SPACESHIP_VI_MODE_SHOW=false

export SPACESHIP_TIME_SHOW=true
export SPACESHIP_TIME_COLOR=$JS_SPACESHIP_GRAY
export SPACESHIP_TIME_FORMAT='%T'

export SPACESHIP_USER_SUFFIX='@'

export SPACESHIP_PROMPT_DISABLE_BOLD=true

export SPACESHIP_DOCKER_SHOW=false
export SPACESHIP_DOCKER_SYMBOL=''
