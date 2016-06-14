#!/usr/bin/env bash
# Detect what kind of system we are running on.
# Intended to be run with "source" or ".".

type -fp lsb_release >/dev/null 2>&1 && export IS_LINUX=YES || IS_LINUX=
export DISTRO=$([[ -n $IS_LINUX ]] && \
  lsb_release -i | sed 's/^.*:\s\+//' | tr "[:upper:]" "[:lower:]" || '')
export SYSTEM=$(uname -s | tr "[:upper:]" "[:lower:]")
nc -z 192.168.10.14 5000
export AT_HOME=$?

function print_host_info () {
  [[ -n $IS_LINUX ]] && lsb_release -a || echo 'lsb_release is not installed';
  uname -a;
  echo;
  [[ -n $IS_LINUX ]] && inxi -Sr;
}
