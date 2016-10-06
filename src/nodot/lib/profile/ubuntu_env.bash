#!/usr/bin/env bash
# Intended to be sourced from .bash_profile

[[ -d /usr/local/go/bin ]] && PATH=/usr/local/go/bin:$PATH
[[ -d /opt/android-studio/bin ]] && PATH=/opt/android-studio/bin:$PATH
. $HOME/lib/profile/as_sudo.bash
