#!/usr/bin/env bash
# Perform initial setup for a new computer

. $HOME/lib/common/systemdetect.bash

PKGINSTALL=$([[ -f $(type -p apt-get) ]] && echo "apt-get install" || "")
#TODO same thing for type -p port for OS X

sudo $PKGINSTALL \
  arp-scan \
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
  tkinfo \
  ubuntu-desktop \
  ubuntu-session \
  unity8 \
  vim \
  vim-gnome \
  wget \
  wmctrl \
  xclip

mkdir $HOME/pyenv
(cd $HOME/pyenv; virtualenv --unzip-setuptools standard2.7)
pip install virtualenvwrapper grip
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | bash
NODE_VERSION=$(curl https://nodejs.org/en/download/ 2>/dev/null | sed -n -e '/Current version:/s/.*\bv\([0-9]\+\.[0-9]\+\.[0-9]\+\)\b.*/\1/p')
nvm install $NODE_VERSION

# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
mkdir -p ~/Github/vim/bundle
# consider tpope's vim-sensible.

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
vim -u NONE \
  -c "helptags vim-fugitive/doc" \
  -c q

# dropbox
#TODO enable samba. dropboxd presently complains:
# Nautilus-Share-Message: Called "net usershare info" but it failed: 'net
# usershare' returned error 255: net usershare: cannot open usershare directory
# /var/lib/samba/usershares. Error No such file or directory
# Please ask your system administrator to enable user sharing.
# tdb(__NULL__): tdb_open_ex: called with name == NULL
# Syntax Warning: Invalid Font Weight
# (nautilus:4688): GLib-CRITICAL **: Source ID 4829 was not found when attempting to remove it
(cd && wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | \
  tar xzf - && (~/.dropbox-dist/dropboxd 2| tee /var/tmp/dropboxd.log) &)

unset PKGINSTALL
