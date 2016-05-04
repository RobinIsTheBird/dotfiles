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

# Quote concatenated variables with begin/end
# Example
# A=aaa; B=bbb; C=ccc
# qut '[' ']' A B C
# ==> [aaabbbccc]
function qut {
  local end_; end_=$2
  local code; code=$1
  shift 2
  while (( $# > 0 )) ; do \
    code+=${!1}
    shift 1
  done;
  code+="$end_"
  echo $code
}

# Escape non printable codes for shell prompting
function ps_ {
  qut "\[" "\]" "$@"
}

# Escape non printable codes for use with bash's builtin read
# Example:
# read -e -p "$(rl_ YEL)Enter $(rl_ HC CYN)some text$(rl_ RS): "
function rl_ {
  qut $'\001' $'\002' "$@"
}

export PS1="${debian_chroot:+($debian_chroot)}$(ps_ HC GRN)\d$(ps_ RS):$(ps_ HC CYN)\w$(ps_ YEL)\$ $(ps_ RS)"
