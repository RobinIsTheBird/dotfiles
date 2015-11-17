#!/usr/bin/env bash

# Set up for PATH
export MACPORTS_HOME='/opt/local'
MACPORTS_LIBRARY="${MACPORTS_HOME}/Library"
MACPORTS_FRAMEWORKS="$MACPORTS_LIBRARY/Frameworks"
export PYTHON32_FRAMEWORK="$MACPORTS_FRAMEWORKS/Python.framework/Versions/3.2"
export PYTHON32_BIN="$PYTHON32_FRAMEWORK/bin" # django-admin.py duplicated here
export PYTHON32_SITE="$PYTHON32_FRAMEWORK/lib/python3.2/site-packages"
export PYTHON27_FRAMEWORK="$MACPORTS_FRAMEWORKS/Python.framework/Versions/2.7"
export PYTHON27_BIN="$PYTHON27_FRAMEWORK/bin" # django-admin.py duplicated here
export PYTHON27_SITE="$PYTHON27_FRAMEWORK/lib/python2.7/site-packages"
export NODE_HOME="~/.node"
NODE_BIN="$NODE_HOME/bin"

# PATH already contains /usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# MacPorts Installer addition on 2014-12-06_at_07:56:40: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH=$NODE_BIN:~/local/bin:~/bin:${PYTHON27_BIN}:$PATH

FLEX_HOME=/Users/robinschaufler/Documents/Tech/flex_sdk_3.4.0.9271
export FLEX_HOME
FLASH_LOG_DIR='/Users/robinschaufler/Library/Preferences/Macromedia/Flash Player/Logs/'
export FLASH_LOG_DIR
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

# CentOS:
# LS_COLORS='no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';

# SVN password is svn-robin
export SVN_EDITOR='/u/qa/tools/svn-editor'
export EDITOR='/usr/bin/vim'
export MANPAGER='/usr/bin/less -iRs'
export GREP_OPTIONS='--color=auto --exclude=/\.svn/'
# ulimit -c unlimited
ulimit -c 0
# readline vi mode
set -o emacs

##
# Your previous /Users/robinschaufler/.bash_profile file was backed up as /Users/robinschaufler/.bash_profile.macports-saved_2014-12-06_at_07:56:40
##
