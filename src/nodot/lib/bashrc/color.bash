#!/usr/bin/env bash
# color aliases
# Intended to be used with "source" or "." from .bashrc.

# Look up key codes using infocmp (from ncurses)
# Check keycodes for the terminal with the bash "read" command

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BBLK="\[\033[40m\]" # background black
BRED="\[\033[41m\]" # background red
BGRN="\[\033[42m\]" # background green
BYEL="\[\033[43m\]" # background yellow
BBLE="\[\033[44m\]" # background blue
BMAG="\[\033[45m\]" # background magenta
BCYN="\[\033[46m\]" # background cyan
BWHT="\[\033[47m\]" # background white
FHRD="\[\033[01;31m\]" # foreground hicolor red
FHGR="\[\033[01;32m\]" # foreground hicolor green
FHYE="\[\033[01;33m\]" # foreground hicolor yellow
FHBL="\[\033[01;34m\]" # foreground hicolor blue
FHMA="\[\033[01;35m\]" # foreground hicolor magenta
FHCY="\[\033[01;36m\]" # foreground hicolor cyan

export PS1="${debian_chroot:+($debian_chroot)}$FHGR\@$RS:$FHCY\w$FHYE\$ $RS"
