#!/usr/bin/env bash

# Set by the systemdetect.bash script
[ $AT_HOME -eq 0 ] || exit 0

pgrep rpcbind &>/dev/null || sudo /sbin/rpcbind

pgrep rpcbind &>/dev/null || sudo /sbin/rpcbind
web="/mnt/Syn-13/web"
robin13="/mnt/Syn-13/Robin"
robin14="/mnt/Syn-14/Robin"
mount | grep -s "$web" || sudo mount -t nfs "syn-13:/volume1/web" "$web"
mount | grep -s "$robin13" || sudo mount -t nfs "syn-13:/volume1/Robin" "$robin13"
mount | grep -s "$robin14" ||sudo mount -t nfs "syn-14:/volume1/robin" "$robin14"
