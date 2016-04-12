#!/usr/bin/env bash
# Mac OS X specific aliases
# Intended to be used with "source" or ".".

function ttab { default_local 10000 & }
function stab { kill -STOP %def ; }
function btab { bg %def ; }
function ktab { kill -9 %def ; }
function splitPDF { splitPDF.py $*; }
function joinPDF { /System/Library/Automator/Combine\ PDF\ Pages.action/Contents/Resources/join.py $*; }

#TODO generalize, also adapt to chromium
function new_chrome () {
  rsync -av --delete --exclude=/Singleton* --exclude=/Session* ~/.config/google-chrome/ /tmp/chrome2/ ;
  google-chrome --user-data-dir=/tmp/chrome2/ ;
}

# Log into syn-13, the synology
function syn () {
  ssh robin@192.168.10.13 ;
}

function set_python_version () {
  if [ -z "$1" ] ; then echo 'set_python_version 27|31|32' && exit 1 ; fi
  sudo port select --set python python$1 ;
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
