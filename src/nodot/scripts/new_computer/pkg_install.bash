#!/usr/bin/env bash

pkgmgr=$(type -p apt-get); pkginstall=${pkgmgr:+"$pkgmgr install"}

sudo $pkginstall \
  apache2-bin \
  arp-scan \
  at \
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
  gnome-gmail \
  gnome-gmail-notifier \
  gnome-session \
  gnome-session-canberra \
  gnome-session-common \
  gnome-shell \
  gpgsm \
  gnupg-agent \
  gnupg-doc \
  grub-doc \
  gvim \
  inxi \
  libssl-dev \
  mailutils \
  mailutils-doc \
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
