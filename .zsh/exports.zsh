# Make vim the default editor.
export EDITOR='nvim';
export TERM='xterm-256color';

# Enable persistent REPL history for `node`.
export NODE_REPL_HISTORY=~/.node_history;
# Allow 32³ entries; the default is 1000.
export NODE_REPL_HISTORY_SIZE='32768';
# Use sloppy mode by default, matching web browsers.
export NODE_REPL_MODE='sloppy';

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';

# Increase ZSH history size. Allow 32³ entries; the default is 500.
export HISTSIZE='32768';
export HISTFILESIZE="${HISTSIZE}";
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth';
export HISTTIMEFORMAT="%h %d %H:%M:%S> "

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X';

export HOMEBREW_CASK_OPTS="--appdir=/Applications"

###
# ANSIBLE
###
export ANSIBLE_HOSTS=/etc/ansible/ec2.py
export EC2_INI_PATH=/etc/ansible/ec2.ini

# Sorry `cowsay` -- turn this noisy shit off.
export ANSIBLE_NOCOWS=1

# Neovim true color support
export NVIM_TUI_ENABLE_TRUE_COLOR=1
# Neovim cursor shape support
export NVIM_TUI_ENABLE_CURSOR_SHAPE=1

