#!/usr/bin/env bash

if mountpoint -q /mnt/Syn-14/Robin ; then
  mkdir -p /mnt/Syn-14/Robin/backups/$(hostname);
  sudo duplicity --full-if-older-than 1W \
    --include /home --include /etc --exclude '**' / \
    file:///mnt/Syn-14/Robin/backups/$(hostname);
fi
