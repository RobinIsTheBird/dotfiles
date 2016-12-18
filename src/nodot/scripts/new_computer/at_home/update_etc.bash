#!/usr/bin/env bash

LOCAL_FSTAB=$HOME/scripts/new_computer/at_home/01local.fstab
[ -f $LOCAL_FSTAB ] && sudo cp $LOCAL_FSTAB /etc/fstab.d/01local

CANON=$(sudo arp-scan -l | grep -i canon)
FOUND_CANON=$?
CANON_SED=$([ $FOUND_CANON -eq 0 ] &&
  echo $CANON | cut -f 1 -d ' ' | sed 's/.*/-e \/^$\/i&\\ canon-pixma')

sed \
  -e '/127\.0\.1\.1/d' \
  -e '/canon-pixma-5220/d' \
  -e '/convergs/d' \
  -e '/syn-13/d' \
  -e '/syn-14/d' \
  -e '/esxi/d' \
  -e '/^$/i 127.0.1.1 '"$(hostname) $DISTRO $SYSTEM" \
  -e '/^$/i 76.124.163.200 converge' \
  -e '/^$/i 192.168.10.13 syn-13' \
  -e '/^$/i 192.168.10.14 syn-14' \
  -e '/^$/i 192.168.10.11 esxi' \
  "$CANON_SED" \
    /etc/hosts > /tmp/hosts

sudo cp -p /etc/hosts /etc/hosts.old;
sudo mv /tmp/hosts /etc/hosts;

unset MAX
unset ADD_HOSTS
unset CANON
unset FOUND_CANON
unset CANON_IP
unset SED_CMD

mkdir -p /mnt/Syn-13/web
mkdir -p /mnt/Syn-13/Robin
mkdir -p /mnt/Syn-14/Robin
grep -q "Syn-13/web" /etc/fstab || \
  sudo echo 'syn-13:/volume1/web /mnt/Syn-13/web nfs rw,user,noauto 0 0' >> /etc/fstab;
grep -q "Syn-13/Robin" /etc/fstab || \
  sudo echo 'syn-13:/volume1/Robin /mnt/Syn-13/Robin nfs rw,user,noauto 0 0' >> /etc/fstab;
grep -q "Syn-14/Robin" /etc/fstab || \
  sudo echo 'syn-14:/volume1/robin /mnt/Syn-14/Robin nfs rw,user,noauto 0 0' >> /etc/fstab;
