#!bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade

sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
sudo apt-get -y install mosh

echo "Set user($(whoami)) password"
sudo passwd $(whoami)

echo "Run mosh"
mosh-server new -s
echo "Exist and connect with mosh for mobile cli!!"

