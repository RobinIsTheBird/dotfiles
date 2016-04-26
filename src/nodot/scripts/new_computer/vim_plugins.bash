#!/usr/bin/env bash

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
