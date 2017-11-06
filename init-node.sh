#!/bin/bash

function install {
    echo installing $1
    shift
    sudo apt -y install "$@" > /dev/null 2>&1
}

sudo apt-get -y update
install Tmux tmux

sudo add-apt-repository ppa:jonathonf/vim
sudo apt -y update
install Vim vim
install Mosh mosh

install "Oh-my-zsh" zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" >/dev/null 2>&1
echo "export EDITOR=vim" >> ~/.zshrc

install "essentials" build-essential curl wget libsqlite3-dev libpq-dev

install Redis redis-server redis-tools

echo "installing rvm and ruby"
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
curl -sSL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm
rvm install 2.4 >/dev/null 2>&1
gem update --system >/dev/null 2>&1
gem install bundler >/dev/null 2>&1
rvm rvmrc warning ignore allGemfiles

sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8

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
