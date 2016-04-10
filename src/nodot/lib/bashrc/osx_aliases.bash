#!/usr/bin/env bash
# Mac OS X specific aliases
# Intended to be used with "source" or ".".

#TODO generalize, also adapt to chromium
function new_chrome () { \
  rsync -av --delete --exclude=/Singleton* --exclude=/Session* ~/.config/google-chrome/ /tmp/chrome2/ ; \
  google-chrome --user-data-dir=/tmp/chrome2/ ; \
}
