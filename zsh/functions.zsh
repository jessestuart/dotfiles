#!/usr/bin/env zsh

function zdo() {
  sudo zsh -c "$functions[$1]" "$@"
}

# ====================================
# Create a new directory and enter it.
# ====================================
function mkd() {
  mkdir -p "$@" && cd "$_";
}

# ==========================================================================
# Create a .tar.gz archive, using `zopfli`, `pigz` or `gzip` for compression
# ==========================================================================
function targz() {
  local tmpFile="${@%/}.tar";
  tar -cvf "${tmpFile}" --exclude=".DS_Store" "${@}" &>/dev/null || return 1;

  size=$(
    stat -f"%z" "${tmpFile}" 2> /dev/null; # macOS `stat`
    stat -c"%s" "${tmpFile}" 2> /dev/null;  # GNU `stat`
  );

  local cmd="";
  if (( size < 52428800 )) && hash zopfli 2> /dev/null; then
    # the .tar file is smaller than 50 MB and Zopfli is available; use it
    cmd="zopfli";
  else
    if hash pigz 2> /dev/null; then
      cmd="pigz";
    else
      cmd="gzip";
    fi;
  fi;

  echo "Compressing .tar ($((size / 1000)) kB) using \`${cmd}\`…";
  "${cmd}" -v "${tmpFile}" &> /dev/null || return 1;
  [ -f "${tmpFile}" ] && rm "${tmpFile}";

  zippedSize=$(
    stat -f"%z" "${tmpFile}.gz" 2> /dev/null; # macOS `stat`
    stat -c"%s" "${tmpFile}.gz" 2> /dev/null; # GNU `stat`
  );

  echo "${tmpFile}.gz ($((zippedSize / 1000)) kB) created successfully.";
}

# =====================================================
# Determine size of a file or total size of a directory
# =====================================================
function fs() {
  if sudo du -b /dev/null > /dev/null 2>&1; then
    local arg=-sbh;
  else
    local arg=-sh;
  fi
  if [[ -n "$@" ]]; then
    sudo du $arg -- "$@";
  else
    sudo du $arg .[^.]* ./*;
  fi;
}

# =============================
# Create a data URL from a file
# =============================
function dataurl() {
  local mimeType=$(file -b --mime-type "$1");
  if [[ $mimeType == text/* ]]; then
    mimeType="${mimeType};charset=utf-8";
  fi
  echo "data:${mimeType};base64,$(openssl base64 -in "$1" | tr -d '\n')";
}

# =========================
# Create a git.io short URL
# =========================
function gitio() {
  if [ -z "${1}" -o -z "${2}" ]; then
    echo "Usage: \`gitio slug url\`";
    return 1;
  fi;
  curl -i https://git.io/ -F "url=${2}" -F "code=${1}";
}

# ======================================================================
# Start an HTTP server from a directory, optionally specifying the port.
# (Usually prefer something like _zeit's_ [`serve`](zeit-serve).)
# [zeit-serve](https://github.com/zeit/serve)
# ======================================================================
function server() {
  local port="${1:-8000}";
  sleep 1 && open "http://localhost:${port}/" &
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port";
}

# ======================================
# Compare original and gzipped file size
# ======================================
function gz() {
  local origsize=$(wc -c < "$1");
  local gzipsize=$(gzip -c "$1" | wc -c);
  local ratio=$(echo "$gzipsize * 100 / $origsize" | bc -l);
  printf "orig: %d bytes\n" "$origsize";
  printf "gzip: %d bytes (%2.2f%%)\n" "$gzipsize" "$ratio";
}

# ========================================
# UTF-8-encode a string of Unicode symbols
# ========================================
function escape() {
  printf "\\\x%s" $(printf "$@" | xxd -p -c1 -u);
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo ""; # newline
  fi;
}

# ==============================================
# Decode \x{ABCD}-style Unicode escape sequences
# ==============================================
function unidecode() {
  perl -e "binmode(STDOUT, ':utf8'); print \"$@\"";
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo ""; # newline
  fi;
}

# ====================================
# Get a character’s Unicode code point
# ====================================
function codepoint() {
  perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
  # print a newline unless we’re piping the output to another program
  if [ -t 1 ]; then
    echo ""; # newline
  fi;
}

# ===============================================================
# Show all the names (CNs and SANs) listed in the SSL certificate
# for a given domain
# ===============================================================
function getcertnames() {
  if [ -z "${1}" ]; then
    echo "ERROR: No domain specified.";
    return 1;
  fi;

  local domain="${1}";
  echo "Testing ${domain}…";
  echo ""; # newline

  local tmp=$(echo -e "GET / HTTP/1.0\nEOT" \
    | openssl s_client -connect "${domain}:443" -servername "${domain}" 2>&1);

  if [[ "${tmp}" = *"-----BEGIN CERTIFICATE-----"* ]]; then
    local certText=$(echo "${tmp}" \
      | openssl x509 -text -certopt "no_aux, no_header, no_issuer, no_pubkey, \
      no_serial, no_sigdump, no_signame, no_validity, no_version");
    echo "Common Name:";
    echo ""; # newline
    echo "${certText}" | grep "Subject:" | sed -e "s/^.*CN=//" | sed -e "s/\/emailAddress=.*//";
    echo ""; # newline
    echo "Subject Alternative Name(s):";
    echo ""; # newline
    echo "${certText}" | grep -A 1 "Subject Alternative Name:" \
      | sed -e "2s/DNS://g" -e "s/ //g" | tr "," "\n" | tail -n +2;
    return 0;
  else
    echo "ERROR: Certificate not found.";
    return 1;
  fi;
}

# ============================================================================
# `o` with no arguments opens the current directory, otherwise opens the given
# location
# ============================================================================
function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

# =============================================================================
# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
# =============================================================================
function tre() {
  tree -aC \
    -I '.git|node_modules|bower_components' \
    --dirsfirst "$@" \
    | less -FRNX
}

# function nuke() {
#   local result=$({ mv "$1" "$1.removing" && rm -rf "$1.removing" &> /dev/null } &;)
#   printf '\n'
# }

function truecolor() {
  awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
  }'
}

function git_list_branches() {
  local limit_num_branches=0
  if [ $# -eq 0 ]; then
    limit_num_branches=30
  else
    limit_num_branches=$1
  fi

  for branch in `git branch -r | grep -v HEAD`; do
    echo -e $(git show --format="%ci %cr" $branch | head -n 1) \\t$branch;
  done | sort | tail -$limit_num_branches
}

function sf() {
  if [ "$#" -lt 1 ]; then echo "Supply string to search for!"; return 1; fi
  printf -v search "%q" "$*"
  local include="yml,js,json,php,md,styl,pug,jade,html,config,py,cpp,c,go,hs,rb,conf,fa,lst"
  local exclude=".config,.git,node_modules,vendor,build,yarn.lock,*.sty,*.bst,dist,public,.cache"
  local rg_command='
    rg --column --line-number --no-heading --fixed-strings --ignore-case \
       --no-ignore --hidden --follow --color "always" \
       -g "*.{'$include'}" -g "!{'$exclude'}/*" \
  '
  local files=`eval $rg_command $search | fzf --ansi --multi --reverse | awk -F ':' '{print $1":"$2":"$3}'`
  [[ -n "$files" ]] && "${EDITOR:-vim}" "$files"
}

function copy() {
  cat "$1" | pbcopy
}

# ====================================================================
# Utility function to tar and gzip a file or directory -- this creates
# an archive in the current directory with a filename like
# `${ORIGINAL_FILENAME}-{current-datetime}.tar.gz`.
# ====================================================================
function archv() {
  if [ $# -eq 1 ]; then
    local filename=$1
    local archive_filename="$filename-$(date +"%Y%m%d_%H%M").tar.gz"
    arc archive $archive_filename $filename
  fi
  if [ $# -eq 2 ]; then
    local archive_filename=$1
    local filename=$2
    (
      set noclobber
      arc archive $archive_filename $filename
    )
  fi
  echo "Archived $filename to $archive_filename."
}

# ===========================================================================
# Utility function to tar and gzip a file or directory, then move the created
# archive to a given directory for automated backup -- in this case, I use
# `~/Dropbox/Backup/Archive`.
# ===========================================================================
function arkcp() {
  local input=$1
  local DROPBOX_BACKUP_ARCHIVE=~/Dropbox/Backup/Archive
  local archive_filename="$input$(date +"%Y%m%d_%H%M").tar.gz"
  arc archive $archive_filename $input
  mv $archive_filename $DROPBOX_BACKUP_ARCHIVE
  echo "Archived $input to $DROPBOX_BACKUP_ARCHIVE/$archive_filename."
}

# ==========================================================================
# Get macOS Software Updates, and update installed Ruby gems, Homebrew, npm,
# and their installed packages.
# ==========================================================================
function system_update() {
  sudo softwareupdate -i -a
  brew update
  brew upgrade
  brew cleanup
  npm install npm -g
  npm update -g
}
alias sysup=system_update

# ====================================================================
# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
# ====================================================================
function empty_trash() {
  sudo \rm -rfv /Volumes/*/.Trashes
  sudo \rm -rfv ~/.Trash
  sudo \rm -rfv /private/var/log/asl/*.asl
  sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'
}

alias ts="date +%s"

# TEMP
function convert_icon() {
  file=$1
  name=$2
  path=$HOME/dev/js-gatsby-hurtling/src/components/Icons/$name
  rm -f $path
  $(which svgr) --no-semi --icon $file > $path
}

function fuck() {
  TF_PYTHONIOENCODING=$PYTHONIOENCODING;
  export TF_ALIAS=fuck;
  export TF_SHELL_ALIASES=$(alias);
  export TF_HISTORY="$(fc -ln -10)";
  export PYTHONIOENCODING=utf-8;
  TF_CMD=$(
      thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
  ) && eval $TF_CMD;
  unset TF_HISTORY;
  export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
  test -n "$TF_CMD" && print -s $TF_CMD
}

function dut() {
  (( $# == 0 )) && set -- .

  if grep -q -i 'GNU' < <(du --version 2>&1); then
    sudo du -ahc --max-depth=1 "$@" | sort -h
  else
    local line size name
    local -a record

    while IFS=$'\n' read line; do
      record=(${(z)line})
      size="$(($record[1] / 1024.0))"
      name="$record[2,-1]"
      printf "%9.1LfM    %s\n" "$size" "$name"
    done < <(sudo du -kcs "$@") | sort -n
  fi
}

# ==============================================================================
# Defines transfer alias and provides easy command line file and folder sharing.
# ==============================================================================
function transfer() {
  # check arguments
  if [ $# -eq 0 ]; then
    echo "No arguments specified. Usage:\ntransfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
    return 1
  fi

  # get temporarily filename, output is written to this file show progress can be showed
  tmpfile=$(mktemp -t transferXXX)

  # upload stdin or file
  file=$1

  if tty -s;
  then
    basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

    if [ ! -e $file ];
    then
      echo "File $file doesn't exists."
      return 1
    fi

    if [ -d $file ];
    then
      # zip directory and transfer
      zipfile=$( mktemp -t transferXXX.zip )
      cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
      curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
      rm -f $zipfile
    else
      # transfer file
      curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
    fi
  else
    # transfer pipe
    curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
  fi

  # cat output link
  if hash bat &>/dev/null; then
    bat -p $tmpfile
  else
    cat $tmpfile
  fi

  # cleanup
  rm -f $tmpfile
}

# Allow sudo invocation of custom functions.
function zsudo() {
  sudo zsh -c "$functions[$1]" "$@"
}

function profile() {
  local iterations=$1
  test -z $iterations && iterations=10
  for i in $(seq 1 $iterations); do
    /usr/bin/time zsh -ic exit
  done
}

function bak() {
  for file in $@; do
    sudo mv "$file" "$file.bak"
  done
}

function unbak() {
  for file in $@; do
    sudo mv "$file" "$(echo $file | sed 's/\.bak//')"
  done
}

function swap() {
  set noclobber
  local file1=$1
  local file2=$2
  mv "$file1" "$file1.bak"
  mv "$file2" "$file1"
  mv "$file1.bak" "$file2"
  set clobber
}

function sum() {
  sum=0
  while read i; do sum=$(($sum+$i)); done; echo $sum
}

function nag() {
  local cmd="$@"
  echo $cmd
  while true; do zdo $cmd; sleep 1; done
}

# function cheat() {
#   /usr/local/bin/cheat $1 | bat -l Markdown --theme TwoDark -p
# }

function uniqx() {
  awk '{ if (!h[$0]) { print $0; h[$0]=1 } }'
}

# # =====================================================
# # @see https://github.com/git-time-metric/gtm/wiki/FAQs
# # =====================================================
function git {
  command git "$@"
  rc=$?
  if [ $rc -ne 0 ]; then
    return $rc
  fi
  if ! hash gtm &>/dev/null; then
    return
  fi
  case "$1" in
    init)
      output=$(gtm init)
      if [ $? -eq 0 ]; then
        echo "$output"
      fi
      ;;
    status)
      output=$(gtm status)
      if [ $? -eq 0 ]; then
        echo "$output"
      fi
      ;;
  esac
  return $rc
}

### BREW + FZF
# update multiple packages at once
# mnemonic [B]rew [U]pdate [P]lugin
###
function bip() {
  local inst=$(brew search | eval "fzf ${FZF_DEFAULT_OPTS} -m --header='[brew:install]'")

  if [[ $inst ]]; then
    for prog in $(echo $inst)
    do brew install $prog
    done
  fi
}

function explain() {
  # Base url with first command already injected
  local url="http://explainshell.com/explain/$1?args="
  shift;

  # iterates over remaining args and adds builds the rest of the url
  for i in "$@"; do
    url=$url"$i""+"
  done

  # opens url in browser
  open $url
}

function fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
