#!/usr/bin/env bash
# Configure bash history
# Intended to be run with "source" or ".".

export HISTSIZE=1000
export HISTFILESIZE=2000
# don't put duplicate lines or lines starting with space in the history.
# To also ignore lines starting with space, use ignoreboth.
# See bash(1) for more options
export HISTCONTROL=ignoredups
