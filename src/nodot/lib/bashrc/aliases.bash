#!/usr/bin/env bash
# General aliases
# Intended to be used with "source" or ".".

alias sudo='sudo -E'
alias node="env NODE_NO_READLINE=1 rlwrap node -e \"require('repl').start({ignoreUndefined: true});\""

function + () {
  pushd "$@" ;
}
function - () {
  popd "$@" ;
}
function findRoutes () {
  for f in "$@" ; do
    echo "$f:" ;
    sed -n '/routes\s*:/,/^\s*}/p' "$f" ;
  done
}
function git () {
  HUB=/usr/local/bin/hub
  [ -f $HUB ] && $HUB "$@" || /usr/bin/git "$@" ;
}
function git-commit-grep () {
  for f in `git log "$1" | grep '^commit' | sed -e 's/commit //' -e 's#$#:'"$1"'#'` ; do
    git cat-file -p $f | grep "$2" ;
  done
}
function git-merge-base () { \
  git merge-base --all --octopus "$@" | xargs git terselog -1 ; \
}

function git-committers () {
  if (($# < 2)); then
    echo Usage: git-committers other-branch interesting-branch
    echo where other-branch contains commits to omit from the log of interesting-branch.
    return ;
  fi ;
  git authorlog --cherry-pick --right-only $1...$2 | sed 's/.*| //' | sed 's/:.*//' | sort -u
}

function git-line-hist () {
  if (($# < 3)); then
    echo Usage: git-line-hist start-line end-line file
    return ;
  fi ;
  git log --pretty=short -u -L $1,$2:$3
}

function grepjs () {
  grep -R --include='*.js' "$@"
}
function grepless () {
  grep -R --include='*.less' "$@"
}
function greppy () {
  grep -R --include='*.py' "$@"
}
function grepbash () {
  grep -R --include='*.bash' "$@"
}
function grephtml () {
  grep -R --include='*.html' "$@"
}
function grepex () {
  grep -R --exclude='*.pyc' --exclude='*.po' --exclude='*.pdf' --exclude='*.sw*' --exclude='*.orig' --exclude='*.map' --exclude-dir='node_modules' "$@"
}

function alltypes () {
  type -a "$1" | sed '/^\w\+.*)/,/^}/d'
}

function termwidth () {
  printf '\e[8;%b;%bt' $(tput lines) $1;
}

function prettyjson () {
  python -m json.tool "$@" ;
}

function clip () {
  xclip -selection clipboard ;
}

function manindex () {
  man -S $1 -k '.*' ;
}

if [[ -x $(which hasher) ]] ; then
  function show_hash () {
    hasher $1 | gedit -
  } ;
fi

# From mschreiber:
function xargspaces () {
  tr '\n' '\000' | xargs -0 "$@" ;
}
# :From mschreiber
# ~/bin/keychain id_rsa id_dsa
# . ~/.keychain/$HOSTNAME-sh

# sudo pmset -a hibernatemode 0

# If X11 control-keys get set to just the key value, run setxkbmap.
