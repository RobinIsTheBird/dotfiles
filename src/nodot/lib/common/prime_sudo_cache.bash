#!/usr/bin/env bash
# Intended to be sourced.
# Prime the sudo cache.

function is_400 () {
  local lsout=$(ls -ld $1)
  local perm="${lsout:1:10}"
  test $perm = 'r--------'
}

if [[ ! -e $HOME/.pwrc ]] || ! is_400 $HOME/.pwrc ; then
  echo 'Please put your password in ~/.pwrc and chmod 400'
  exit 0
fi
echo 'Found .pwrc'
cat $HOME/.pwrc | sudo -S /bin/true &>/dev/null # cache password
