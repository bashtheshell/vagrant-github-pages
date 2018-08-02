#!/usr/bin/env bash

# Update the system
sudo apt -y update && sudo apt -y upgrade

### --- THE SCRIPT BELOW IS COPIED FROM https://rvm.io/rvm/security --- ###

# Install mpapis public key for RVM (might need `gpg2` and or `sudo`) 
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

# Download the RVM installer
\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer
\curl -O https://raw.githubusercontent.com/rvm/rvm/master/binscripts/rvm-installer.asc

# Verify the installer signature (might need `gpg2`), and if it validates...
gpg --verify rvm-installer.asc &&

# Run the RVM installer
bash rvm-installer stable

### --- THE SCRIPT ABOVE IS COPIED FROM https://rvm.io/rvm/security --- ###

# Immediately use RVM
source /home/vagrant/.rvm/scripts/rvm

# Install the latest stable and set it to default
rvm --default install ruby

# Mirror the GitHub environment
gem install github-pages

# Install the dependency manager for Ruby's gems
gem install bundler

