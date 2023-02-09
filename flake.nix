# flake.nix
{
  description = "MacBoop Flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
      nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
      home-manager = {
        url = "github:nix-community/home-manager";
        # nix will normally use the nixpkgs defined in home-managers inputs, we only want one copy of nixpkgs though
        inputs.nixpkgs.follows = "nixpkgs";
      };
      darwin = {
        url = "github:lnl7/nix-darwin";
        # nix will normally use the nixpkgs defined in nix-darwin inputs, we only want one copy of nixpkgs though
        inputs.nixpkgs.follows = "nixpkgs";
      };
      nix-colors.url = "github:misterio77/nix-colors";
  };
  
  # add the inputs declared above to the argument attribute set
  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, darwin, nix-colors }: 
    {
      # we want `nix-darwin` and not gnu hello, so the packages stuff can go
      darwinConfigurations."macboop" = darwin.lib.darwinSystem {
        # you can have multiple darwinConfigurations per flake, one per hostname

        system = "aarch64-darwin"; # "x86_64-darwin" if you're using a pre M1 mac
        specialArgs = {
          inherit nixpkgs-unstable; 
          inherit nix-colors;
        };
        modules = [ 
          home-manager.darwinModules.home-manager
          { 
            home-manager.extraSpecialArgs = { 
              inherit nixpkgs-unstable; 
              inherit nix-colors;
            };
          }
          ./hosts/macboop/default.nix
        ]; # will be important later
      };
    };

    # TODO: Make a dev shell which provides `pkgs.nil` the Nix LSP binary.
    # devShells.default = mkShell {
    #   buildInputs = [
    #     pkgs.nil
    #   ];

    #   shellHook = ''
    #   '';
    # };
}
