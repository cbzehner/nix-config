# users/cbzehner/home.nix
{ ... }: {
  imports = [ ./programs ];

  # Set environment variables for login shell sessions
  home.sessionVariables = {
    EDITOR = "hx";
    PAGER = "bat";
    LC_ALL = "en_US.UTF-8";
    LC_CTYPE = "en_US.UTF-8";
  };
  
}
