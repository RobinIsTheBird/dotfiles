#!/usr/bin/env bash

sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install nodejs

# node version manager
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
NODE_VERSION=$(curl https://nodejs.org/en/download/ 2>/dev/null | sed -n -e '/Current version:/s/.*\bv\([0-9]\+\.[0-9]\+\.[0-9]\+\)\b.*/\1/p')
nvm install $NODE_VERSION
