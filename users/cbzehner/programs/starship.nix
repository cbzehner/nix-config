# users/cbzehner/programs/starship.nix
{ ... }:
{
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };
}
