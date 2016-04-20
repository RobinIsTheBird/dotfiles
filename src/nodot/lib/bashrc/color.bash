#!/usr/bin/env bash
# color aliases
# Intended to be used with "source" or "." from .bashrc.

# Look up keycodes in man 5 terminfo
# Check keycodes for the terminal with the bash "read" command

# ANSI color codes
RS=$(tput sgr0)    # reset
HC=$(tput bold)    # hicolor
UL=$(tput smul)    # underline
INV=$(tput rev)    # inverse background and foreground
BLK=$(tput setaf 0)
RED=$(tput setaf 1)
GRN=$(tput setaf 2)
YEL=$(tput setaf 3)
BLE=$(tput setaf 4)
MAG=$(tput setaf 5)
CYN=$(tput setaf 6)
WHT=$(tput setaf 7)

export PS1="${debian_chroot:+($debian_chroot)}$HC$GRN\d$RS:$HC$CYN\w$HC$YEL\$ $RS"
