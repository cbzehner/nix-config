# Nix Configuration

Inspired by https://xyno.space/post/nix-darwin-introduction + past failed attempts at Nix adoption.

## Setup

### MacOS
1. Install Nix via [the official installer](https://nixos.org/download.html).
1. Clone this repository and navigate to it. Generally `git clone ... && cd nix-config/`.
1. Run an initial build to bootstrap your system. `nix build .#darwinConfigurations.<HostName>.system --extra-experimental-features "nix-command flakes"`.
1. Create a new `/private/var/run` directory and initialize it. `printf 'run\tprivate/var/run\n' | sudo tee -a /etc/synthetic.conf; /System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util -t`.
1. Initialize your system using the bootstrapped build. `./result/sw/bin/darwin-rebuild switch --flake .`
1. Set up configurations for `nix-darwin` to set environmental variables. `echo 'if test -e /etc/static/bashrc; then . /etc/static/bashrc; fi' | sudo tee -a /etc/bashrc` and `echo 'if test -e /etc/static/zshrc; then . /etc/static/zshrc; fi' | sudo tee -a /etc/zshrc`.
