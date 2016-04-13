#!/usr/bin/env bash
# Intended to be used with "source" or "." from .bashrc.

LOCALRC=$HOME/lib/profile/$(hostname).bash
[[ -f $LOCALRC ]] && . $LOCALRC
