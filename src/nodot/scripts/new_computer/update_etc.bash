#!/usr/bin/env bash

echo 'Consider adding the following to /etc/hosts:'
echo '127.0.1.1	$(hostname) $SYSTEM nickname nickname ...'

grep -s "canon-pixma-5220" || \
  gawk '/^$/ { print "192.168.10.171 canon-pixma-5220" }; { print }' \
  /etc/hosts > /tmp/hosts
sudo mv /tmp/hosts /etc/hosts

grep -s "converge" || \
  gawk '/^$/ { print "76.124.163.200 converge" }; { print }' \
  /etc/hosts > /tmp/hosts
sudo mv /tmp/hosts /etc/hosts

grep -s "syn-13" || \
  gawk '/^$/ { print "192.168.10.13 syn-13" }; { print }' \
  /etc/hosts > /tmp/hosts
sudo mv /tmp/hosts /etc/hosts
