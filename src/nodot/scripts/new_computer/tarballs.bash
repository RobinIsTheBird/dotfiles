#!/usr/bin/env bash

DOWNLOAD=$HOME/Downloads/hub-linux-amd64-2.2.3
curl -s -o $DOWNLOAD.tgz https://github.com/github/hub/releases/download/v2.2.3/hub-linux-amd64-2.2.3.tgz
tar xzf $DOWNLOAD.tgz -C $HOME/Downloads
sudo $DOWNLOAD/install && rm -r $DOWNLOAD $DOWNLOAD.tgz
