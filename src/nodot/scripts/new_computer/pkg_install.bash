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
  ethtool \
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
  mailutils \
  node \
  npm \
  openssh \
  python-virtualenv \
  rlwrap \
  sendmail \
  ssh \
  synaptic \
  tkinfo \
  traceroute \
  ubuntu-desktop \
  ubuntu-session \
  unity8 \
  vim \
  vim-gnome \
  wget \
  wmctrl \
  xclip
