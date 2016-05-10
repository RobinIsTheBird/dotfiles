#!/usr/bin/env bash
# Setup for virtual environments, such as nvm, rvm, python virtualenv
# Intended to be used with "source" or ".".

. $HOME/pyenv/standard2.7/bin/activate
nvm use -g v4.4.2
echo 'Cannot do `gvm use go1.6.2 --default` within bashrc.'
echo "It fails with Unrecognized command line argument: 'use'"
echo 'even though ${GVM_ROOT}/scripts/env/use exists'
