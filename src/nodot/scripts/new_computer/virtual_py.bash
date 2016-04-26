#!/usr/bin/env bash

# python virtualenv
mkdir $HOME/pyenv
(cd $HOME/pyenv; virtualenv --unzip-setuptools standard2.7)
pip install virtualenvwrapper grip
