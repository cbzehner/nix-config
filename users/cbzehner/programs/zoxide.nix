# users/cbzehner/programs/zoxide.nix
{ ... }:
{
  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
