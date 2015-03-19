#!/bin/bash

for f in src/* ; do \
  fname=${f#src/} ; \
  if [[ ~/.${fname} -nt $f ]] ; then \
    echo "taking in ${fname}" ; \
    cp ~/.${fname} $f ; \
  fi \
done
