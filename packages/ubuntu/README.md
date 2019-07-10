# Programs
A quick way of backing up a list of programs is to run this:

```
dpkg --get-selections > ~/dotfiles/software/ubuntu/package.list
sudo cp -R /etc/apt/sources.list* ~/dotfiles/software/ubuntu
sudo apt-key exportall > ~/dotfiles/software/ubuntu/repo.keys
```

It will back them up in a format that dpkg can read* for after your reinstall, like this:

```
sudo apt-key add ~/dotfiles/software/ubuntu/repo.keys
sudo cp -R ~/dotfiles/software/ubuntu/sources.list* /etc/apt/
sudo apt-get update
sudo apt-get install dselect
sudo dselect update
sudo dpkg --set-selections < ~/dotfiles/software/ubuntu/package.list
sudo apt-get dselect-upgrade -y
```

https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages
