#!/usr/bin/env bash
# Debian specific aliases
# Intended to be used with "source" or ".".

function apt-list () { \
  dpkg --get-selections | grep -v deinstall ; \
}
