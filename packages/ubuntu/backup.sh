#!/usr/bin/bash
FOLDER="$HOME/dotfiles/packages/ubuntu/"
dpkg --get-selections > "$FOLDER/package.list"
sudo cp -R /etc/apt/sources.list* "$FOLDER/sources/"
sudo apt-key exportall > "$FOLDER/keys/repo.keys"
