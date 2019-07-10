dpkg --get-selections > ~/dotfiles/packages/ubuntu/package.list
sudo cp -R /etc/apt/sources.list* ~/dotfiles/packages/ubuntu/
sudo apt-key exportall > ~/dotfiles/packages/ubuntu/repo.keys
