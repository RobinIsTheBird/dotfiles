#!/bin/bash

if [[ $# -lt 1 ]] ; then \
  echo "usage: install.sh destdir" ; \
  return 1 ; \
fi

for f in src/* ; do \
  fname=${f#src/} ; \
  cp $f $1.${fname}; \
done
