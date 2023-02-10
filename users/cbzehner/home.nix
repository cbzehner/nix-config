# users/cbzehner/home.nix
{ ... }: {
  imports = [ ./programs ];

  # Set environment variables for login shell sessions
  home = {
    sessionVariables = {
      EDITOR = "hx";
      PAGER = "bat";
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF-8";
      NIX_DARWIN_FLAKE = "$HOME/projects/nix-config";
    };

    shellAliases = {
      rebuild = "darwin-rebuild switch --flake $NIX_DARWIN_FLAKE";
      # Safety first!
      rm = "rm -i";
      cp = "cp -i";
      mv = "mv -i";
      mkdir = "mkdir -p";
      # accessible-coreutils (see https://github.com/cbzehner/accessible-coreutils/blob/master/aliases.sh)
      build = "make";
      compare = "diff"; # or cmp or colordiff
      copy = "pbcopy";
      count = "wc";
      create-file = "touch";
      create-folder = "mkdir -p";
      dedup = "uniq";
      delete = "rm -rv";
      docs = "man";
      duplicate = "cp -RPiv";
      edit = "hx"; # or vim, emacs, code, nano, etc.
      environment = "env";
      find-contents = "rg"; # or grep
      find-name = "fd"; # or find or fzf
      find = "fd --type f --exclude '.git'"; # or find or fzf
      go = "z"; # or cd
      help = "tldr"; # or man
      jump = "z"; # or cd
      list = "exa --git-ignore --group-directories-first --classify"; # or ls
      move = "mv -iv";
      paste = "pbpaste";
      print = "echo";
      process = "procs"; # or ps
      profile = "time"; # or hyperfine
      remove = "rm -rv";
      rename = "mv -iv";
      search = "rg"; # or grep
      shortcut = "link -s"; # Usage: <source_file> <link_location>. link and ln are the same utility
      # source="git"
      split = "cut";
      unique = "uniq";
      view = "bat"; # or cat
      where = "pwd";
    };
  };
}
