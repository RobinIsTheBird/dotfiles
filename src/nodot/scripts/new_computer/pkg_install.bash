#!/usr/bin/env bash

pkgmgr=$(type -p apt-get); pkginstall=${pkgmgr:+"$pkgmgr install"}

sudo $pkginstall \
  arp-scan \
  bash-doc \
  bison \
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
  tkinfo \
  ubuntu-desktop \
  ubuntu-session \
  unity8 \
  vim \
  vim-gnome \
  wget \
  wmctrl \
  xclip
