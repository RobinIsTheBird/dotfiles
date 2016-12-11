#!/usr/bin/env bash

sudo cp $HOME/scripts/new_computer/at_home/01local.fstab /etc/fstab.d/01local

CANON=$(sudo arp-scan -l | grep -i canon)
FOUND_CANON=$?
CANON_IP=$([ $FOUND_CANON -eq 0 ] && echo $CANON | cut -f 1 -d ' ')

ADD_HOSTS='/^$/i'
! grep -q "127\." /etc/hosts || \
  ADD_HOSTS[${#ADD_HOSTS[@]}]="127.0.1.1 $(hostname) $DISTRO $SYSTEM"
! grep -q "canon-pixma-5220" /etc/hosts || [ $FOUND_CANON -eq 0 ] && \
  ADD_HOSTS[${#ADD_HOSTS[@]}]="${CANON_IP} canon-pixma-5220"
! grep -q "converge" /etc/hosts || \
  ADD_HOSTS[${#ADD_HOSTS[@]}]="76.124.163.200 converge"
! grep -q "syn-13" /etc/hosts || \
  ADD_HOSTS[${#ADD_HOSTS[@]}]="192.168.10.13 syn-13"
! grep -q "syn-14" /etc/hosts || \
  ADD_HOSTS[${#ADD_HOSTS[@]}]="192.168.10.14 syn-14"
! grep -q "esxi" /etc/hosts || \
  ADD_HOSTS[${#ADD_HOSTS[@]}]="192.168.10.11 esxi"

MAX=${#ADD_HOSTS[@]}
if [ $MAX -gt 1 ] ; then
  let MAX=MAX-1;
  SED_CMD=
  for i in ${!ADD_HOSTS[@]}; do
    SED_CMD=${SED_CMD}${ADD_HOSTS[$i]};
    [ $i -lt $MAX ] && SED_CMD=${SED_CMD}\\\\\\n;
  done;
  echo -e $SED_CMD | sed -f - /etc/hosts > /tmp/hosts;
  sudo cp -p /etc/hosts /etc/hosts.old;
  sudo mv /tmp/hosts /etc/hosts;
fi

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
