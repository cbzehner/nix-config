# users/cbzehner/programs/zellij.nix
{ ... }:
{
  programs.zellij = {
    enable = true;
    settings = {
      copy_command = "pbcopy";
      copy_on_select = false;
    }
    # TODO: Add a theme using nix-colors
  }
}
