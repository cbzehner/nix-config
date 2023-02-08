# hosts/macboop/default.nix
{ pkgs, ... }:
{
  imports = [
    ../common-macos.nix
    ../../users/cbzehner
  ];

  networking = {
    computerName = "MacBoop Pro";
    hostName = "macboop";
  };
  
  security.pam.enableSudoTouchIdAuth = true;

  # Settings available to all users
  environment = {
    # Packages installed in system profile. 
    systemPackages = [
      # pkgs.helix
    ];
  };

}
