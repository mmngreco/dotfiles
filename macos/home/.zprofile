if [ -e /home/mgreco/.nix-profile/etc/profile.d/nix.sh ]; then . /home/mgreco/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
[ -d "$HOME/.cargo/" ] && . "$HOME/.cargo/env"

# opam configuration
test -r /home/mgreco/.opam/opam-init/init.sh && . /home/mgreco/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# if [[ "do-etls" = "$(hostname)" ]]; then
    #
    # [ -f ~/.profile ] && source ~/.profile
    # export TERM=xterm-256color
    # [ -f ~/.bashrc ] && source ~/.bashrc
    # export DOTFILES=$HOME/.dotfiles
    #
# fi

# macos {
# if macos
eval "$(/opt/homebrew/bin/brew shellenv)"

