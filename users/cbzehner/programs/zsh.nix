# users/cbzehner/programs/zsh.nix
{ ... }:
{
  programs.zsh = {
    enable = true; # default shell on catalina
    enableAutosuggestions = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;

    history = {
      expireDuplicatesFirst = true;
      ignorePatterns = [
        "cd -"
        "hx"
        "ls"
        "list"
        "fg"
      ];
    };
  };
}
