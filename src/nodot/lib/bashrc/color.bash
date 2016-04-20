#!/usr/bin/env bash
# color aliases
# Intended to be used with "source" or "." from .bashrc.

# Look up key codes using infocmp (from ncurses)
# Check keycodes for the terminal with the bash "read" command

# ANSI color codes
RS="\e[0m"    # reset
HC="\e[1m"    # hicolor
UL="\e[4m"    # underline
INV="\e[7m"   # inverse background and foreground
FBLK="\e[30m" # foreground black
FRED="\e[31m" # foreground red
FGRN="\e[32m" # foreground green
FYEL="\e[33m" # foreground yellow
FBLE="\e[34m" # foreground blue
FMAG="\e[35m" # foreground magenta
FCYN="\e[36m" # foreground cyan
FWHT="\e[37m" # foreground white
BBLK="\e[40m" # background black
BRED="\e[41m" # background red
BGRN="\e[42m" # background green
BYEL="\e[43m" # background yellow
BBLE="\e[44m" # background blue
BMAG="\e[45m" # background magenta
BCYN="\e[46m" # background cyan
BWHT="\e[47m" # background white
FHRD="\e[01;31m" # foreground hicolor red
FHGR="\e[01;32m" # foreground hicolor green
FHYE="\e[01;33m" # foreground hicolor yellow
FHBL="\e[01;34m" # foreground hicolor blue
FHMA="\e[01;35m" # foreground hicolor magenta
FHCY="\e[01;36m" # foreground hicolor cyan

export PS1="${debian_chroot:+($debian_chroot)}$FHGR\d$RS:$FHCY\w$FHYE\$ $RS"
