#!/usr/bin/env bash
# Intended to be sourced.
export WORKON_HOME=$HOME/pyenv
export VIRTUALENVWRAPPER_HOOK_DIR=$HOME/bin
WRAPPER=$WORKON_HOME/standard2.7/bin/virtualenvwrapper.sh
[ -f $WRAPPER ] && source $WRAPPER
