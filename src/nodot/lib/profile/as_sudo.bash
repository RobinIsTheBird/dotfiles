#!/usr/bin/env bash

. $HOME/lib/common/prime_sudo_cache.bash

# Steve presently has ping disabled
# ping -c 1 -W 5 -q syn-13 &>/dev/null || exit 0
# instead, use net cat
nc -z syn-13 111 || exit 0

pgrep rpcbind &>/dev/null || sudo /sbin/rpcbind
web="/mnt/Syn-13/web"
robin13="/mnt/Syn-13/Robin"
robin14="/mnt/Syn-14/Robin"
mount | grep -s "$web" || sudo mount -t nfs "syn-13:/volume1/web" "$web"
mount | grep -s "$robin13" || sudo mount -t nfs "syn-13:/volume1/Robin" "$robin13"
mount | grep -s "$robin14" ||sudo mount -t nfs "syn-14:/volume1/robin" "$robin14"
