# dotfiles

Here are my configuration files.

- `install.conf.yaml`: Is the file where it's defined the symlinks and some
    commands.
- `bin`: Contains executables binaries or scripts.
- `git`: Git configuration.
- `shell`: Contains configuration relatives to shell like `bashrc` and `zshrc`.
- `software`: Contains scripts to install commons applications under demand.
- `vim/plugins`: Plugins configuration.
- `vim`: Vim configuration which is a link to `config/nvim/init.vim`.
- `wm/i3`:  window manager i3 configuration.

## Installation

```bash
git clone --recurse-submodules ssh://git@gitlab.com/mmngreco/dotfiles ~/.dotfiles
cd ~/.dotfiles
./install
```
### Update

```bash
dotfilesLink
```

### Software

it's possible execute every script in `software` folder from everywhere using
the bash function `dotinst`:

```bash
dotinst  # allows you to choose what to install
dotinst ag fzf
```

## Issues

- firefox screen tearing: https://www.reddit.com/r/i4wm/comments/bk8cmw/strange_graphics_issue_when_using_i3/
