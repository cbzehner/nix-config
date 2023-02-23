{ ... }:
{
  programs.git = {
    enable = true;
    userName = "Chris Zehner";
    userEmail = "chris@cbzehner.com";
    aliases = {
      amend = "commit --amend";
      br = "branch";
      co = "commit";
      last = "log -1 HEAD";
      pf = "push --force-with-lease";
      st = "status";
    };
    ignores = [ "*~" ".DS_Store" ];
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      # url = {
      #   "git@github.com:" = {
      #     insteadOf = "https://github.com/";
      #   };
      # };
      merge.conflictstyle = "diff3";
      pull = {
        rebase = true;
      };
      push = { 
        autoSetupRemote = true;
      };
    };
    delta.enable = true;
  };
}
