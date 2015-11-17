#!/bin/bash

if [[ $# -lt 1 ]] ; then \
  echo "usage: install.sh destdir/" ; \
  return 1 ; \
fi

for f in src/dotfiles/* ; do \
  fname=${f#src/dotfiles/} ; \
  destf=$1.${fname} ; \
  if [[ -d ${destf} ]] ; then \
    rm -r ${destf} ; \
    cp -r $f ${destf} ; \
  else \
    cp $f ${destf} ; \
done

mkdir $1/bashrcLib >/dev/null 2>&1
unamestr=$(uname)
cp src/nodot/bashrcLib/env/${unamestr,,}.bash $1/bashrcLib/env.bash
chmod a+x $1/bashrcLib/env.bash
