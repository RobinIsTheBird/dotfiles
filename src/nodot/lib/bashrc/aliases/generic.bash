# ~/.bashrc: executed by bash(1) for non-login shells.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
function lf () { ls -CF $*; }
function la () { ls -A $*; }
function ll () { ls -alF $*; }

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias sudo='sudo -E'
alias node="env NODE_NO_READLINE=1 rlwrap node"

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
function apt-list () { \
  dpkg --get-selections | grep -v deinstall ; \
}
function sshg () { \
  hg --config 'extensions.mercurial_keyring=!' $@ ; \
}
function startservices () { \
  sudo su ; \
  service lighttpd start ; \
  exit ; \
}
function explode () { \
  ant clean exploded_ear && notify-send "Build Passed" || alert ; \
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
# See http://manpages.ubuntu.com/manpages/hardy/man1/x11vnc.1.html
function startx11vnc () { \
    if [[ -n `which x11vnc` ]]; then
        x11vnc -display :0 -autoport 5900 -forever -usepw -bg -o ${USER_HOME}/x11vnclog.txt -rfbauth ${USER_HOME}/.vnc/passwd ; \
    fi
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

#TODO generalize
function new_chrome () { \
  rsync -av --delete --exclude=/Singleton* --exclude=/Session* ~/.config/google-chrome/ /tmp/chrome2/ ; \
  google-chrome --user-data-dir=/tmp/chrome2/ ; \
}
