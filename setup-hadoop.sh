#!/bin/bash
# Simple setup-hadoop.sh for configuring Ubuntu 12.04 LTS EC2 instance with Hadoop
# for headless setup. 

sudo apt-get update
sudo apt-get upgrade -y

# Install emacs24
sudo apt-get install -y emacs24

# Install Java
sudo apt-get install -y openjdk-7-jdk
# set to the root of your Java installation
export JAVA_HOME=/usr
  
# Install Hadoop
cd /usr/local
sudo wget http://apache.arvixe.com/hadoop/common/hadoop-2.6.0/hadoop-2.6.0.tar.gz
sudo gunzip hadoop-2.6.0.tar.gz 
sudo tar xvf hadoop-2.6.0.tar 
sudo mv hadoop-2.6.0 hadoop
sudo chown -R ubuntu /usr/local/hadoop
export HADOOP_PREFIX=/usr/local/hadoop
PATH=$PATH:$HADOOP_PREFIX/bin

# Install Pig
cd
wget http://download.nextag.com/apache/pig/pig-0.14.0/pig-0.14.0.tar.gz
gunzip pig-0.14.0.tar.gz
sudo mv pig-0.14.0.tar /usr/local
cd /usr/local
sudo tar xvf pig-0.14.0.tar 
sudo chown -R ubuntu /usr/local/pig-0.14.0
export PATH=/usr/local/pig-0.14.0/bin:$PATH

# git pull and install dotfiles as well
cd $HOME
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/pps4f/dotfiles.git
ln -sb dotfiles/.screenrc .
ln -sb dotfiles/.bash_profile .
ln -sb dotfiles/.bashrc .
ln -sb dotfiles/.bashrc_custom .
ln -sf dotfiles/.emacs.d .
