function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

# Outputs the name of the current branch
# Usage example: git pull origin $(git_current_branch)
# Using '--quiet' with 'symbolic-ref' will not cause a fatal error (128) if
# it's not a symbolic ref, but in a Git repo.
function git_current_branch() {
  local ref
  ref=$(command git symbolic-ref --quiet HEAD 2> /dev/null)
  local ret=$?
  if [[ $ret != 0 ]]; then
    [[ $ret == 128 ]] && return  # no git repo.
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return
  fi
  echo ${ref#refs/heads/}
}

function current_branch() {
  git_current_branch
}

function take {
  mkdir $1
  cd $1
}

# Allows commit message without typing quotes (can't have quotes in the commit
# msg though).
function gc {
  git commit -m "$*"
}

function ghcl() {
  local REPO_URL=$1
  local GITHUB_ROOT="$HOME/github"
  local FOLDER_NAME="$(echo $REPO_URL | sed 's:.*/::')"
  local FOLDER_PATH="$GITHUB_ROOT/$FOLDER_NAME"
  pushd $GITHUB_ROOT
  hub clone $REPO_URL
  echo "Cloned repository to $FOLDER_PATH."
  echo "The absolute path has been copied to your clipboard."
  echo $FOLDER_PATH | pbcopy
  popd
}

# Function for "git branch", handling the "list" case, by sorting it according
# to committerdate, and displaying it.
function gb() {
  setopt localoptions rcexpandparam
  local refs limit=100

  if [[ $# == 0 ]]; then
    refs=(refs/heads)
  else
    # Parse -r and -a for special handling.
    local parsed_opts
    zparseopts -D -E -a parsed_opts r a

    # Parse all other args/opts.
    typeset -a opts args
    for i do
      if [[ ${i[1]} == '-' ]]; then
        opts+=($i)
      else
        args+=($i)
      fi
    done

    if (( $#parsed_opts )); then
      if (( $parsed_opts[(I)-r] )); then
        refs=(refs/remotes)
      elif (( $parsed_opts[(I)-a] )); then
        refs=(refs/heads refs/remotes)
      fi
    fi

    if (( $opts[(I)(--no-merged|--merged)] )); then
      # Pass options to git-branch, e.g. '--no-merged' and use resulting refs.
      refs=(refs/heads/${(@)$(git branch --list $opts | sed -E 's/^[* ] //')})
    fi

    # If there is only one number arg, and no pass-through option (e.g. "-D"),
    # then use that as a limit.
    if ! (( $#opts )) && (( $#args == 1 )); then
      if [[ $args[1] == <-> ]]; then
        # Display last X branches only.
        if [[ -z $refs ]]; then
          refs=(refs/heads)
        fi
        limit=$args[1]
      fi
    fi
  fi

  if [[ -z $refs ]]; then
    git branch "$@"
  else
    # XXX: there's a problem with ANSI escape codes, which get considered by
    # zformat, although invisible.

    local color_object=${(%):-'%F{yellow}'}
    local color_date=${(%):-'%F{cyan}'}
    local color_subject=${(%):-'%B%f'}
    local color_author=${(%):-'%F{blue}'}
    local color_current=${(%):-$(git config --get-color color.branch.current blue)}
    local color_local=${(%):-$(git config --get-color color.branch.local normal)}
    local color_remote=${(%):-$(git config --get-color color.branch.remote red)}
    local current=$(current_branch)
    local line
    typeset -a lines info_string
    info_string=(
      "%(refname:short)"
      "%(authorname)"
      "${color_date}%(committerdate:format:%Y-%m-%d %H:%M)${reset_color}"
      "${color_subject}%(subject)${reset_color}"
      "%(objectname:short)"
    )
    local my_name="$(git config user.name)"
    local b
    for b in ${(f)"$(git for-each-ref --sort=-committerdate $refs \
        --format="\0${(j:\0:)info_string}" --count=$limit)"}; do
      b=(${(s:\0:)b})

      # Describe object name (and keep orig sha for comparison with prev_sha).
      b[6]=${b[5]}
      b[5]="${color_object}$(git describe --contains --always $b[5])${reset_color}"

      # Decorate or remove author name.
      local author_name=$b[2]
      b=($b[1] $b[3,-1])
      if [[ $author_name != $my_name ]]; then
        b[3]="$b[3] (${color_author}$author_name${reset_color})"
      else
        # Include escape codes for zformat alignment.
        b[3]="$b[3] ${color_author}${reset_color}"
      fi

      lines+=("${b[1]}\0${(j-\0-)${(@)b[2,-1]}}")
    done

    # Use zformat recursively, which requires escaping ":" on the left side.
    typeset -a before escaped_lines format_lines
    local i left right split
    # Copy lines to format_lines with last column (orig sha) removed.
    for line in $lines; do
      split=(${(s:\0:)line})
      format_lines+=("${(j:\0:)split[1,-2]}")
    done

    local col maxlen
    # Format first two columns (branch and subject) using zformat.
    for col in {1..2}; do
      before=($format_lines)
      escaped_lines=()

      if (( COLUMNS > 100 )); then
        (( $col == 1 )) && maxlen=50 || maxlen=30
      else
        (( $col == 1 )) && maxlen=40 || maxlen=20
      fi
      for line in $format_lines; do
        split=(${(s:\0:)line})
        if (( ${#:-"$(remove_ansi_codes ${split[$col]})"} > $maxlen )); then
          split[$col]="__skipped_$(printf '.%.0s' {1..$((maxlen-10))})"
        fi
        # Escape left side.
        left=${${(j:\0:)split[1,$col]}//:/\\:}
        left=${left//\0/\\0}
        right=${(j:\0:)split[$((col+1)),-1]}
        escaped_lines+=("$left:$right")
      done

      zformat -a format_lines "\0" $escaped_lines
    done

    (( $#format_lines )) || return

    local orig_cols orig_col1 sha
    local cur_sha="$(git rev-parse --verify -q --short HEAD)"
    local prev_sha="$(git rev-parse --verify -q --short @{-1})"
    for i in {1..$#format_lines}; do
      line=$format_lines[$i]
      split=(${(s:\0:)line})
      for col in {1..$#split}; do
        if [[ $split[$col] == "__skipped_"* ]]; then
          split[$col]=${${(s:\0:)lines[$i]}[$col]}
        fi
      done

      # Prepend different colors.
      orig_cols=(${(s:\0:)lines[$i]})
      orig_col1=${orig_cols[1]}
      sha="${orig_cols[-1]}"
      if [[ $sha == $cur_sha ]]; then
        split[1]="* $split[1]"
      elif [[ $sha == $prev_sha ]]; then
        split[1]="- $split[1]"
      else
        split[1]="  $split[1]"
      fi

      if [[ $orig_col1 == $current ]]; then
        # split[1]="${(%):-%B}${split[1]}${(%):-%b}"
        split[1]="${color_current}$split[1]"
      elif [[ $orig_col1 == */* ]]; then
        split[1]="${color_remote}$split[1]"
      else
        split[1]="${color_local}$split[1]"
      fi

      lines[$i]=${(j: :)split}
    done

    # Display it using "less", but only to cut at $COLUMNS.
    echo ${${(j:\n:)lines}} | \less --no-init --chop-long-lines --QUIT-AT-EOF
  fi
}
compdef -e 'words=(git branch "${(@)words[2,-1]}"); ((CURRENT++)); _normal' gb

# Delete or list merged branched.
gbmcleanup() {
  setopt localoptions errreturn
  local -a opts only
  zparseopts -D -a opts f q h i n l m v o+:=only
  local curb merged
  local -A no_diff
  local from_branches='^(master|develop)$'
  local keep_branches='^(master|develop|local)$'

  if (( $opts[(I)-h] )); then
    echo "Cleans merged branches."
    echo "$0 [-i] [-f] [-n] [-l] [-m] [-v] [-o branch]"
    echo " -l: list"
    echo " -n: dry run"
    echo " -i: interactive (show diff for each branch, asking for confirmation)"
    echo " -f: force"
    echo " -m: test for empty merges"
    echo " -v: verbose"
    return
  fi
  local interactive=$opts[(I)-i]
  local force=$opts[(I)-f]
  local dry_run=$opts[(I)-n]
  local list=$opts[(I)-l]
  local test_merges=$opts[(I)-m]
  local verbose=$opts[(I)-v]
  only=(${only:#-o})
  local branch="$1"

  if [[ -z "$branch" ]]; then
    branch="$(current_branch)"
    if [[ -z $branch ]]; then
      echo "No current branch. Aborting."
      return 1
    fi
  fi

  if ! (( $list )) && ! (( $force )) && ! (( $dry_run )) \
      && ! [[ $branch =~ $from_branches ]] ; then
    echo "Current branch does not match '$from_branches'." 2>&1
    echo "Use -f to force." 2>&1
    return 1
  fi

  merged=($(git branch --merged $branch | sed -E "/^[* ] $branch\$/d" \
    | cut -b3- | sed -E "/$keep_branches/d"))

  local b not_merged
  not_merged=(${(f)"$(git branch --no-merged | cut -b3- \
    | sed -E "/$keep_branches/d")"})
  if [[ -n $only ]]; then
    not_merged=(${not_merged:*only})
  fi

  local branch_color=`git config --get-color color.branch.local blue`
  local reset_color=`tput sgr0`
  local cmd

  if (( $#not_merged )); then
    if (( $test_merges )); then
      local diff out rev_list merge_base
      local -A rev_diff
      local display_progress=$(($#not_merged > 20))
      local -F 2 start duration
      local last_b
      for b in $not_merged; do
        if [[ -n "$last_b" ]]; then
          duration=$(( ($(print -P '%D{%s%.}') - start) / 1000 ))
          if (( duration > 1.0 )); then
            echo "slow: $last_b (${duration}s)"
          fi
        fi
        start=$(print -P '%D{%s%.}')
        last_b=$b
        (( display_progress )) && echo -n '.' >&2
        # Look for empty merges (no hunks with git-merge-tree).
        # Otherwise "merged" means that it could be merged without conflicts.
        merge_base=$(git merge-base HEAD "$b")
        cmd=(git merge-tree $merge_base HEAD "$b")
        out=("${(@f)$($cmd)}")
        if ! print -l $out | \grep -q '^@@'; then
          no_diff+=($b "empty merge")
          continue
        else
          # Check for cherry-picks, that cause a conflict with merge-tree, but
          # should be OK.
          rev_list=(${(f)"$(git rev-list --abbrev-commit "$merge_base..HEAD")"})
          branch_diff=$(git diff "$merge_base" $b --)
          for i in $rev_list; do
            if [[ -z "${rev_diff[$i]}" ]]; then
              rev_diff[$i]="$(git diff "$i^" "$i" --)"
            fi
            if [[ "$rev_diff[$i]" == "$branch_diff" ]]; then
              no_diff+=($b "cherry-picked in $(git name-rev $i)")
              continue
            fi
          done
        fi
        if (( $verbose )); then
          if (( $#only )); then
            echo "cmd: $cmd" >&2
            print -l $out >&2
          else
            echo "$out[1]: $branch_color$b$reset_color ($#out lines)" >&2
          fi
        fi
      done
      (( display_progress )) && echo
    else
      echo "NOTE: Not testing $#not_merged non-merged branches, use -m." >&2
    fi
  fi

  if (( $#merged )); then
    echo ${(%):-"%BMerged branches:%b"} >&2
    for b in $merged; do
      echo "$branch_color$b$reset_color"
    done
  fi
  if (( $#no_diff )); then
    echo ${(%):-"%BBranches with empty merges:%b"} >&2
    for b in ${(k)no_diff}; do
      echo "$branch_color$b$reset_color: $no_diff[$b]"
    done
  fi
  if (( $list )); then
    return
  fi
  merged+=(${(k)no_diff})
  if ! (( $#merged )); then
    return
  fi

  if ! (( $interactive )); then
    printf "Delete? (y/N) "
    read -q || { echo; return }; echo
  fi

  cmd=(git branch -D)
  if (( $dry_run )); then
    cmd=(echo $cmd)
  fi

  if (( $interactive )); then
    echo "$#merged branches to process: $merged"

    for b in $merged; do
      view '+set ft=diff' =(echo "== $b =="; git show $b)
      printf "Delete? "
      read -q || { echo; continue }; echo
      $cmd $b
    done
  else
    $cmd $merged
  fi
}

function git-new-remote-tracking {
  git checkout -b $1 && git push -u origin $1
}

function git_branch_name {
  val=`git branch 2>/dev/null | grep '^*' | colrm 1 2`
  echo "$val"
}

function git-done {
  branch=`git_branch_name`
  git checkout master && git merge $branch --ff-only && bundle install && prepdb && bin/rspec && git push && git-nuke $branch
}

function git-nuke {
  git branch -D $1 && git push origin :$1
}
compdef _git git-nuke=git-checkout

function git-on-master {
  branch=`git_branch_name`
  git checkout master && git pull --rebase
  git checkout $branch
  git rebase master && git push -f
}

