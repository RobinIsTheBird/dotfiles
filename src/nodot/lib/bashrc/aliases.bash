alias sudo='sudo -E'
alias node="env NODE_NO_READLINE=1 rlwrap " \
  "node -e \"require('repl').start({ignoreUndefined: true});\""

function + () { \
  pushd $@ ; \
}
function - () { \
  popd $@ ; \
}
function findRoutes () { \
  for f in "$@" ; do \
    echo "$f:" ;
    sed -n '/routes\s*:/,/^\s*}/p' "$f" ; \
  done
}
function grepjs () { \
  grep --include='*.js' -r "$@" * ; \
}
function grephist () { \
  for f in `git log "$1" | grep '^commit' | sed -e 's/commit //' -e 's#$#:'"$1"'#'` ; do \
    git cat-file -p $f | grep "$2" ; \
  done
}
function git-merge-base () { \
  git merge-base --all --octopus $@ | xargs git terselog -1 ; \
}

function git-committers () { \
  if (($# < 2)); then
    echo Usage: git-committers other-branch interesting-branch
    echo where other-branch contains commits to omit from the log of interesting-branch.
    return ; \
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

alias lessgrep='grep -R --include=*.less'
alias pygrep='grep -R --include=*.py'

function termwidth () {
  printf '\e[8;%b;%bt' `tput lines` $1;
}

function prettyjson () {
  python -m json.tool $@ ;
}

function clip () {
  xclip -selection clipboard ;
}
