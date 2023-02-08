# hosts/common-macos.nix
{ pkgs, ... }:
{
  imports = [ ./common.nix ];

  system.defaults.LaunchServices.LSQuarantine = false; # Disable quarantine for downloaded applications
  system.defaults.NSGlobalDomain.AppleICUForce24HourTime = true; # Use 24-hour clock
  system.defaults.dock.autohide = true; # Auto-hide the dock
  system.defaults.finder.AppleShowAllExtensions = true; # Show all file extensions
  system.defaults.loginwindow.GuestEnabled = false; # Disable Guest login
  system.keyboard.enableKeyMapping = true; # Allow nix-darwin to remap keys
  system.keyboard.remapCapsLockToControl = true; # Remap caps lock to control for better ergonomics

  # if you use zsh (the default on new macOS installations),
  # you'll need to enable this so nix-darwin creates a zshrc sourcing needed environment changes
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableFzfCompletion = true;
    enableFzfHistory = true;
    enableSyntaxHighlighting = true;
  };
  # bash is enabled by default

  homebrew = {
    enable = true;
    # updates homebrew packages on activation,
    # can make darwin-rebuild much slower (otherwise i'd forget to do it ever though)
    onActivation.autoUpdate = true;
    casks = [
      "arc"
      "google-chrome"
      "firefox"
      "1password"
      "amethyst"
      "alacritty"
      "docker"
      "zoom"
      "spotify"
      "calibre"
    ];
  };

}