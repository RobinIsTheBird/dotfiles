#!/usr/bin/env bash

# Set by the systemdetect.bash script
[ $AT_HOME -eq 0 ] || exit 0
mount /mnt/Syn-13/web
mount /mnt/Syn-13/Robin
mount /mnt/Syn-14/Robin
