#!/usr/bin/env bash
# Perform initial setup for a new computer

. $HOME/lib/common/systemdetect.bash

PKGINSTALL=$([[ -f $(type -p apt-get) ]] && echo "apt-get install" || "")
#TODO same thing for type -p port for OS X

sudo $PKGINSTALL \
  bash-doc \
  build-essential \
  chromium \
  curl \
  dpkg-dev \
  gconf-editor \
  gdebi \
  gdm \
  git \
  gksu \
  gksudo \
  gnome-common \
  gnome-session \
  gnome-session-canberra \
  gnome-session-common \
  gnome-shell \
  gvim \
  inxi \
  libssl-dev \
  node \
  npm \
  openssh \
  python-virtualenv \
  rlwrap \
  ssh \
  synaptic \
  ubuntu-desktop \
  ubuntu-session \
  unity8 \
  vim \
  vim-gnome \
  wget \
  wmctrl

sudo pip install virtualenvwrapper
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
NODE_VERSION=$(curl https://nodejs.org/en/download/ 2>/dev/null | sed -n -e '/Current version:/s/.*\bv\([0-9]\+\.[0-9]\+\.[0-9]\+\)\b.*/\1/p')
nvm install $NODE_VERSION

# install Github/insanum/gcalcli
# install Github/tpope/vim-pathogen
# install Github/vim/bundle
# vim: after  autoload  bundle  plugin
# vim/after: ftplugin  syntax
# vim/after/ftplugin: coffee.vim  python.vim
# vim/after/syntax: css.vim  c.vim  html.vim  javascript.vim  python.vim
# vim/plugin
# vim/autoload/pathogen.vim
# install the following vim bundles:
# css.vim  vim-coffee-script  vim-fugitive  vim-less  Vundle.vim
# install scratch plugin
# install git plugin

unset PKGINSTALL
