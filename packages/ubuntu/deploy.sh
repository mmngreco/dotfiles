#!/usr/bin/bash
FOLDER="$HOME/dotfiles/packages/ubuntu/"

sudo apt-key add "$FOLDER/keys/repo.keys"
sudo cp -R "$FOLDER/sources/sources.list*" /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < "$FOLDER/package.list"
sudo apt-get dselect-upgrade -y
