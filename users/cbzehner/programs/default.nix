# users/cbzehner/programs/default.nix
{ ... }:
{
  imports = [
    ./alacritty.nix
    ./git.nix
    ./helix.nix
    ./starship.nix
    ./tealdeer.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];
}
