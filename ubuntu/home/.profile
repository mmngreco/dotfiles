#!/bin/bash
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
# umask 022

# Here it says it's better define TERM in the Xresources
# https://github.com/tmux/tmux/issues/2818
# ... but here it says that the problems can be fixed by adding xterm-256color
# in tmux.conf https://github.com/tmux/tmux/issues/321
# export TERM=xterm

# dotfiles
export TAKT_FILE="$HOME/.takt-log/seedtag.csv"
export DOTFILES_SRC="$HOME/.dotfiles"
export DOTFILES_HOME="$HOME/.dotfiles"
export DOTFILES="$HOME/.dotfiles/ubuntu"
# export DEFAULT_PROMPT=0  # starship
# export DEFAULT_PROMPT=1
# export DEFAULT_PROMPT=2
# export DEFAULT_PROMPT=3
# export DEFAULT_PROMPT=4
export DEFAULT_PROMPT=2  # user@host path branch \n $

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# google drive
if [ -x "$(command -v google-drive-ocamlfuse)" ]; then
    if [ -z "$(ls -A /mnt/google-drive)" ]; then
        google-drive-ocamlfuse /mnt/google-drive
    fi
fi

# xterm config
[ -x "$(command -v xrdb)" ] && xrdb -load ~/.Xresources &> /dev/null

# rust
[ -d "$HOME/.cargo/" ] && . "$HOME/.cargo/env"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
[ -x "$(command -v pyenv)" ] && eval "$(pyenv init --path)"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"


# >>> coursier install directory >>>
export PATH="$PATH:/Users/mgreco/Library/Application Support/Coursier/bin"
# <<< coursier install directory <<<
