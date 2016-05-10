#!/usr/bin/env bash

. ../common/prime_sudo_cache.bash

pgrep rpcbind &>/dev/null || sudo /sbin/rpcbind
web="/mnt/Syn-13/web"
robin="/mnt/Syn-13/Robin"
mount | grep -s "$web" || sudo mount -t nfs "syn-13:/volume1/web" "$web"
mount | grep -s "$robin" || sudo mount -t nfs "syn-13:/volume1/Robin" "$robin"