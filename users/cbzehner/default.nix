# users/cbzehner/default.nix
{ pkgs, nixpkgs-unstable, nix-colors, generate-github-keypair, ... }:
let
  pkgsUnstable = import nixpkgs-unstable {
    system = pkgs.system;
    config.allowunfree = true;
  };
  generateGitHubKeyPair = generate-github-keypair.packages.aarch64-darwin.generate-github-keypair;
  # generateGitHubKeyPair = ../../scripts/generate-github-keypair/flake.nix;
  # generateGitHubKeyPair' = pkgs.callPackage generateGitHubKeyPair {};
in {
  nixpkgs.config.allowUnfree = true;

  users = {
    users = {
      cbzehner = {
        name = "cbzehner";
        home = "/Users/cbzehner";
      };
    };
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.cbzehner = {
    imports = [
      nix-colors.homeManagerModule
      ./home.nix
    ];

    # Let Home Manager install and manage itself.
    programs.home-manager.enable = true;

    # Home Manager needs a bit of information about you and the
    # paths it should manage.
    home.username = "cbzehner";

    colorScheme = nix-colors.colorSchemes.eighties;

    # This value determines the Home Manager release that your
    # configuration is compatible with. This helps avoid breakage
    # when a new Home Manager release introduces backwards
    # incompatible changes.
    #
    # You can update Home Manager without changing this value. See
    # the Home Manager release notes for a list of state version
    # changes in each release.
    home.stateVersion = "22.11";
  
    home.packages = [
        generateGitHubKeyPair
        # pkgs.heliocron
        pkgs.bandwhich
        pkgs.bat
        pkgs.bottom
        pkgs.broot
        pkgs.choose
        pkgs.direnv
        pkgs.exa
        pkgs.fd
        pkgs.fzf
        pkgs.gh
        pkgs.glow
        pkgs.hexyl
        pkgs.hyperfine
        pkgs.jq
        pkgs.navi
        pkgs.nixpkgs-fmt
        pkgs.pastel
        pkgs.pgcli
        pkgs.procs
        pkgs.procs
        pkgs.ripgrep
        pkgs.rnix-lsp
        pkgs.rustscan
        pkgs.sd
        pkgs.silicon
        pkgs.tokei
        pkgs.uutils-coreutils
        pkgs.xh
        pkgs.xsv
        pkgs.yq
        pkgs.zellij
        pkgs.zoxide
    ];
  };
}
