# hosts/common.nix
{ ... }:
{
  # imports = [
    # ../scripts/generate-github-keypair/flake.nix
  # ];

  nix = {
    gc.automatic = true; # Clean up unused packages to save disk space
    settings.sandbox = true;
  };

  nixpkgs.config.allowUnfree = true; # Do not force the usage of free packages only

  # Make sure the nix daemon always runs
  services.nix-daemon.enable = true;
}