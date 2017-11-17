#!/bin/bash

THISPATH="$( cd "$(dirname "$0")" ; pwd -P )"
sudo apt-get -y install vim
git clone https://github.com/VundleVim/Vundle.vim.git $THISPATH/vim/bundle/Vundle.vim
echo "export EDITOR=vim" >> ~/.zshrc

echo "Create .vimrc symbolic link"
ln -s $THISPATH/vimrc ~/.vimrc
ln -s $THISPATH/vim ~/.vim

vim +PluginInstall +qall
