#!/usr/bin/env bash
# Ubuntu specific aliases
# Intended to be used with "source" or ".".

# See http://manpages.ubuntu.com/manpages/hardy/man1/x11vnc.1.html
function startx11vnc () { \
  if [[ -n `which x11vnc` ]]; then
    x11vnc -display :0 -autoport 5900 -forever -usepw -bg -o ${USER_HOME}/x11vnclog.txt -rfbauth ${USER_HOME}/.vnc/passwd ; \
  fi
}
