sudo apt-key add ~/dotfiles/packages/ubuntu/repo.keys
sudo cp -R ~/dotfiles/packages/ubuntu/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < ~/dotfiles/packages/ubuntu/package.list
sudo apt-get dselect-upgrade -y
