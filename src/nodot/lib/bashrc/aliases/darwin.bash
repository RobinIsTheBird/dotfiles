#!/usr/bin/env bash
FLEX_HOME=/Users/robinschaufler/Documents/Tech/flex_sdk_3.4.0.9271
export FLEX_HOME
FLASH_LOG_DIR='/Users/robinschaufler/Library/Preferences/Macromedia/Flash Player/Logs/'
export FLASH_LOG_DIR
function flexlogdir () { cd "$FLASH_LOG_DIR" ; }
MACPORTS_HOME='/opt/local'
MACPORTS_BIN="$MACPORTS_HOME/bin"
MACPORTS_SBIN="$MACPORTS_HOME/sbin"
MACPORTS_LIB="$MACPORTS_HOME/lib"
MACPORTS_LIBRARY="$MACPORTS_HOME/Library"
MACPORTS_FRAMEWORKS="$MACPORTS_LIBRARY/Frameworks"
NODE_HOME="$HOME/.node"
NODE_BIN="$NODE_HOME/bin"
PYTHON32_FRAMEWORK="$MACPORTS_FRAMEWORKS/Python.framework/Versions/3.2"
PYTHON32_BIN="$PYTHON32_FRAMEWORK/bin" # django-admin.py duplicated here
PYTHON32_SITE="$PYTHON32_FRAMEWORK/lib/python3.2/site-packages"
DJANGO_REL_BIN="django/bin"
DJANGO15_32_BIN="$PYTHON32_SITE/$DJANGO_REL_BIN"
# PATH already contains /usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin
PATH=$NODE_BIN:~/local/bin:~/bin:$MACPORTS_BIN:$MACPORTS_SBIN:/usr/local/bin:$PATH
export PATH
JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/Home
export JAVA_HOME
NODE_MODULES_HOME=/usr/local/lib/node_modules
export NODE_MODULES_HOME
# source $NODE_MODULES_HOME/npm/lib/utils/completion.sh
PS1='\W \$ '
# function lf ()	{ ls -F --color=auto $*; } # CentOS
function lf () { ls -F $*; }
function + () { if [ -z "$1" ] ; then pushd ; else pushd "$1" ; fi }
function - () { popd; }
function ttab { default_local 10000 & }
function stab { kill -STOP %def ; }
function btab { bg %def ; }
function ktab { kill -9 %def ; }
function splitPDF { splitPDF.py $*; }
function joinPDF { /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py $*; }
function remote { \
    SSHDIR=`date '+%s'` ; \
    SSHNAME=`sed -e 's/@/_/' -e 's/\..*//' <<<$1` ; \
    mkdir ~/sshdir-$SSHDIR ; \
    ln /usr/bin/ssh ~/sshdir-$SSHDIR/$SSHNAME ; \
    ~/sshdir-$SSHDIR/$SSHNAME $1 ; \
    rm -rf ~/sshdir-$SSHDIR ; \
}
function vin { \
    VIMDIR=`date '+%s'` ; \
    VIMNAME=`sed 's/.*\///' <<< $PWD` ; \
    if [[ $VIMNAME == g* ]] ; then VIMNAME=_$VIMNAME ; fi
    mkdir ~/vimdir-$VIMDIR ; \
    ln /usr/bin/vim ~/vimdir-$VIMDIR/$VIMNAME ; \
    ~/vimdir-$VIMDIR/$VIMNAME $1 ; \
    rm -rf ~/vimdir-$VIMDIR ; \
}
function tcplook { \
    if [[ $# < 1 ]] ; then \
        echo usage: tcplook dumpname ; \
    else \
        dumpname=$1 ; \
        tcpdump -n -tttt -r $dumpname src port 80 or src port 443 ; \
    fi ; \
}
function tcpread { \
    if [[ $# < 3 ]] ; then \
        echo usage: tcpread dumpname appliance-aux-ip local-ip ; \
    else \
        dumpname=$1 ; \
        auxip=$2 ; \
        localip=$3 ; \
        tcpdump -n -XX -tttt -r $dumpname \
            src host $auxip and \( src port 80 or src port 443 \) \
            and dst host $localip and 'ip[2:2] >= 249' | \
        tcpdata.py ; \
    fi ; \
}
function application { \
    if [[ $# < 1 ]] ; then \
        echo usage: application appname ; \
        exit 1 ; \
    fi ; \
    appname="$1" ; \
    appexec=/Applications/"${appname}".app/Contents/MacOS/"${appname}" ; \
    if [[ ! -a "${appexec}" ]] ; then \
        appexec=/Applications/Utilities/"${appname}".app/Contents/MacOS/"${appname}" ; \
    fi ; \
    "${appexec}"
}

# For Mac OS ls
CLICOLOR=
export CLICOLOR
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
LSCOLORS=gxfxCxdxcxDxDxGxCxBxbx
export LSCOLORS

# CentOS:
# LS_COLORS='no=00:fi=00:di=01;36:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';

# SVN password is svn-robin
SVN_EDITOR='/u/qa/tools/svn-editor'
export SVN_EDITOR
EDITOR='/usr/bin/vim'
export EDITOR
MANPAGER='/usr/bin/less -iRs'
export MANPAGER
GREP_OPTIONS='--color=auto --exclude=/\.svn/'
export GREP_OPTIONS
# ulimit -c unlimited
ulimit -c 0
# readline vi mode
set -o emacs
# From mschreiber:
function xargspaces () { \
  tr '\n' '\000' | xargs -0 "$@" ; \
}
# CentOS version
# function srcfind () { \
# find -type f | fgrep -v "/.svn" | \
# egrep '\.(c|cpp|h|hpp|cc|C|hh|cxx|hxx|py|psp|tem|js|css|html)$'|xargspaces egrep "$@" ; \
# -name c -or -name \*.cpp -or -name \*.h -or -name \*.hpp -or -name \*.cc -or -name \*.C -or -name \*.hh -or -name \*.cxx -or -name \*.hxx -or -name \*.py -or -name \*.psp -or -name \*.tem -or -name \*.js -or -name \*.css -or -name \*.html
# }
# Prune .svn directories
# \( -regex '.*/\.svn.* -prune \)
# was
# \( -not -regex '.*/\.svn.*' \)
function srcfind () { \
  local DIR=. ; \
  if [[ $STARTDIR ]] ; then DIR=$STARTDIR ; fi ; \
  find -x $DIR -type f \( -not -regex '.*/\.svn.*' \) \
    \( -not -regex '.*/rollup.*' \) \( -not -regex '.*/yui3.*' \) \( \
    -name \*.c -or -name \*.cpp -or -name \*.h -or -name \*.hpp -or \
    -name \*.cc -or -name \*.C -or -name \*.hh -or -name \*.cxx -or \
    -name \*.hxx -or -name \*.py -or -name \*.psp -or -name \*.tem -or \
    -name \*.js -or -name \*.css -or -name \*.html -or \
    -name \*.mxml -or -name \*.as -or -name \*.xml \) | \
  xargspaces egrep "$@" ; \
}

function webfind () { \
  for STARTDIR in `find -x . -type d -name web2` ; do \
    srcfind "$@" ; \
  done ; \
  unset STARTDIR ; \
}

# :From mschreiber
# ~/bin/keychain id_rsa id_dsa
# . ~/.keychain/$HOSTNAME-sh

# sudo pmset -a hibernatemode 0

#source ~/.profile

# If X11 control-keys get set to just the key value, run setxkbmap.

# Log into syn-13, the synology
function syn () { \
  ssh robin@192.168.10.13 ; \
}

##
# Your previous /Users/robinschaufler/.bash_profile file was backed up as /Users/robinschaufler/.bash_profile.macports-saved_2014-12-06_at_07:56:40
##

# MacPorts Installer addition on 2014-12-06_at_07:56:40: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

function set_python_version () { \
  if [ -z "$1" ] ; then echo 'set_python_version 27|31|32' ; \
  else sudo port select --set python python$1 fi \
}
