#!/bin/bash

for f in src/dotfiles/* ; do \
  fname=${f#src/dotfiles/} ; \
  destf=~/.${fname} ; \
  if [[ ${destf} -nt $f ]] ; then \
    echo "taking in ${fname}" ; \
    if [[ -d ${destf} ]] ; then \
      cp -r ${destf} $f ; \
    else \
      cp ${destf} $f ; \
    fi \
  fi \
done

for f in src/nodot/* ; do \
  fname=${f#src/nodot/} ; \
  destf=~/${fname} ; \
  if [[ ${destf} -nt $f ]] ; then \
    echo "taking in ${fname}" ; \
    if [[ -d ${destf} ]] ; then \
      cp -r ${destf} $f ; \
    else \
      cp ${destf} $f ; \
    fi \
  fi \
done
