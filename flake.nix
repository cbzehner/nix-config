# flake.nix
{
  description = "MacBoop Flake";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-22.11-darwin";
      # TODO (cbzehner): In progress https://github.com/nix-community/home-manager/issues/1538#issuecomment-1265293260...
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
  };
  
  # add the inputs declared above to the argument attribute set
  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, home-manager, darwin }: 
    let
      # pkgs = nixpkgs.legacyPackages.${system};
      # unstable = nixpkgs-unstable.legacyPackages.${system};
      # unstable = import inputs.nixpkgs-unstable {
      #   system = nixpkgs.system;
      #   config.allowUnfree = true;
      # };
    in {
      # we want `nix-darwin` and not gnu hello, so the packages stuff can go
      darwinConfigurations."macboop" = darwin.lib.darwinSystem {
        # you can have multiple darwinConfigurations per flake, one per hostname

        system = "aarch64-darwin"; # "x86_64-darwin" if you're using a pre M1 mac
        specialArgs = { inherit inputs; };
        modules = [ 
          home-manager.darwinModules.home-manager
          { 
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
          ./hosts/macboop/default.nix
        ]; # will be important later
      };
    };
}
