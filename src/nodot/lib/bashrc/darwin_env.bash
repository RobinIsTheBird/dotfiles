#!/usr/bin/env bash
# Intended to be sourced from bashrc

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
