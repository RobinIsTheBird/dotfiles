#!/usr/bin/env bash
# Intended to be sourced from bash_profile

# Set up for PATH
export MACPORTS_HOME='/opt/local'
export MACPORTS_LIBRARY="${MACPORTS_HOME}/Library"
export MACPORTS_FRAMEWORKS="$MACPORTS_LIBRARY/Frameworks"
export MACPORTS_BIN="$MACPORTS_HOME/bin"
export MACPORTS_SBIN="$MACPORTS_HOME/sbin"
export PYTHON32_FRAMEWORK="$MACPORTS_FRAMEWORKS/Python.framework/Versions/3.2"
export PYTHON32_BIN="$PYTHON32_FRAMEWORK/bin" # django-admin.py duplicated here
export PYTHON32_SITE="$PYTHON32_FRAMEWORK/lib/python3.2/site-packages"
export PYTHON27_FRAMEWORK="$MACPORTS_FRAMEWORKS/Python.framework/Versions/2.7"
export PYTHON27_BIN="$PYTHON27_FRAMEWORK/bin" # django-admin.py duplicated here
export PYTHON27_SITE="$PYTHON27_FRAMEWORK/lib/python2.7/site-packages"
export NODE_HOME="~/.node"
export NODE_BIN="$NODE_HOME/bin"

# PATH already contains /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export PATH=$NODE_BIN:~/local/bin:~/bin:${MACPORTS_BIN}:${MACPORTS_SBIN}:${PYTHON27_BIN}:$PATH

export FLEX_HOME=/Users/robinschaufler/Documents/Tech/flex_sdk_3.4.0.9271
export FLASH_LOG_DIR='/Users/robinschaufler/Library/Preferences/Macromedia/Flash Player/Logs/'
export SHELL=${MACPORTS_HOME}/bin/bash
export PYTHONSTARTUP=~/.pythonrc
export PYTHONPATH=${PYTHON27_FRAMEWORK}/lib/python2.7/
export DJANGO_REL_BIN="django/bin"
export DJANGO15_32_BIN="$PYTHON32_SITE/$DJANGO_REL_BIN"
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export NODE_MODULES_HOME=/usr/local/lib/node_modules
# source $NODE_MODULES_HOME/npm/lib/utils/completion.sh
export PS1='\W \$ '

# For Mac OS ls
export CLICOLOR=
#          1.   directory
#          2.   symbolic link
#          3.   socket
#          4.   pipe
#          5.   executable
#          6.   block special
#          7.   character special
#          8.   executable with setuid bit set
#          9.   executable with setgid bit set
#          10.  directory writable to others, with sticky bit
#          11.  directory writable to others, without sticky bit
export LSCOLORS=gxfxCxdxcxDxDxGxCxBxbx

# SVN password is svn-robin
export SVN_EDITOR='/u/qa/tools/svn-editor'
export EDITOR='/usr/bin/vim'
export MANPAGER='/usr/bin/less -iRs'
export GREP_OPTIONS='--color=auto --exclude=/\.svn/'
# ulimit -c unlimited
ulimit -c 0
# readline vi mode
set -o emacs
