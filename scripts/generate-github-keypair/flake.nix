{
  description = "Generate an SSH keypair for GitHub";

  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { self, nixpkgs, flake-utils }:
   flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
      name = "generate-github-keypair";
      buildInputs = with pkgs; [ cowsay ];
      script = (pkgs.writeScriptBin name (builtins.readFile ./generate-github-keypair.sh)).overrideAttrs(old: {
        buildCommand = "${old.buildCommand}\n patchShebangs $out";
      });
    in rec {
      defaultPackage = packages.script;
      packages.script = pkgs.symlinkJoin {
        name = name;
        paths = [ script ] ++ buildInputs;
        buildInputs = [ pkgs.makeWrapper ];
        postBuild = "wrapProgram $out/bin/${name} --prefix PATH : $out/bin";
      };
    }
  );
}
