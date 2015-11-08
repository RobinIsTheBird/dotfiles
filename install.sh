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

for f in src/nodot/* ; do \
  fname=${f#src/dotfiles/} ; \
  destf=$1${fname} ; \
  if [[ -d ${destf} ]] ; then \
    rm -r ${destf} ; \
    cp -r $f ${destf} ; \
  else \
    cp $f ${destf} ; \
done
