#!/bin/bash

function install {
    echo installing $1
    shift
    sudo apt -y install "$@" > /dev/null 2>&1
}

sudo apt-get -y update > /dev/null 2>&1
install Tmux tmux

install Tree tree

printf '\n' | sudo add-apt-repository ppa:jonathonf/vim
sudo apt -y update >/dev/null 2>&1

install "Oh-my-zsh" zsh
printf '\n' | sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null 2>&1
echo "export TERM=xterm-256color" >> ~/.zshrc

install "essentials" build-essential curl wget libsqlite3-dev 

install Redis redis-server redis-tools

sudo add-apt-repository "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main"
wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get -y update >/dev/null 2>&1
install PostgreSQL postgresql-9.4 postgresql-contrib-9.4 libpq-dev
sudo /etc/init.d/postgresql start
sudo -u postgres createuser --superuser ubuntu

echo "Installing mongodb"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list >/dev/null
sudo apt-get -y update >/dev/null
install Mongodb mongodb-org

echo "installing rvm"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable > /dev/null
source ~/.rvm/scripts/rvm
echo "installing ruby 2.3.3"
rvm install 2.3.3 >/dev/null 2>&1
gem update --system >/dev/null 2>&1
gem install bundler >/dev/null 2>&1
rvm rvmrc warning ignore allGemfiles

echo "installing java-8"
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections 
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt -y update
sudo apt -y install oracle-java8-installer >/dev/null 2>&1
echo "export JAVA_HOME=/usr/lib/jvm/java-8-oracle" >> ~/.zshrc

echo "Removing old docker if it exists"
sudo apt-get remove docker-ce docker docker-engine docker.io

echo "Installing docker"
sudo apt-get update -y
sudo apt-get install -y \
	apt-transport-https \
	ca-certificates \
	curl \
	software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"

sudo apt-get update

sudo apt-get -y install docker-ce

install Vim vim
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
echo "export EDITOR=vim" >> ~/.zshrc
echo "Create .vimrc symbolic link"
THISPATH="$( cd "$(dirname "$0")" ; pwd -P )"
ln -s $THISPATH/vimrc ~/.vimrc

echo "Installing heroku toolbelt"
wget -qO- https://cli-assets.heroku.com/install-ubuntu.sh | sh >/dev/null

echo "install powerline font"
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

echo "Set zsh as a default"
chsh -s $(which zsh)
