#!/usr/bin/env bash

# python virtualenv
export WORKON_HOME=$HOME/pyenv
mkdir -p $WORKON_HOME
(cd $WORKON_HOME; virtualenv --unzip-setuptools standard2.7)
pip install virtualenvwrapper grip
source $WORKON_HOME/initialize
