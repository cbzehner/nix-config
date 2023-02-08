# users/cbzehner/programs/helix.nix
{ pkgs, inputs, ... }:
let
  pkgsUnstable = import inputs.nixpkgs-unstable {
    system = pkgs.system;
    config.allowunfree = true;
  };
in {
  programs.helix = {
    enable = true;
    package = pkgsUnstable.helix;
    settings = {
      editor.cursorcolumn = true;
      keys = {
        normal = {};
        insert = {
          j.k = "normal_mode"; # Maps `jk` to exit insert mode
        };
        select = {};
      };
    };
    
    languages = [ ];
    
  };
}
