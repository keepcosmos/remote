#!/bin/bash

sudo apt-get -y install vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "export EDITOR=vim" >> ~/.zshrc

echo "Create .vimrc symbolic link"
THISPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ln -s $THISPATH/vimrc ~/.vimrc
ln -s $THISPATH/ftplugin ~/.vim/ftplugin
