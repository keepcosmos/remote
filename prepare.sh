#!/bin/bash

sudo apt-get -y update
sudo update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8
sudo apt-get -y install mosh

sudo passwd $(whoami)
