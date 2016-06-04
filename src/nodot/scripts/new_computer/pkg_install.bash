#!/usr/bin/env bash

pkgmgr=$(type -p apt-get); pkginstall=${pkgmgr:+"$pkgmgr install"}

sudo $pkginstall \
  apache2-bin \
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
  grub-doc \
  gvim \
  inxi \
  libssl-dev \
  mailutils \
  ndiswrapper-utils-1.9 \
  nfs-common \
  nmap \
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
