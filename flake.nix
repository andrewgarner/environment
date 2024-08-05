{
  description = "My home configuration";

  inputs = {
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.2405.3571.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };

    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-24.05-darwin";
  };

  outputs = {
    self,
    darwin,
    home-manager,
    nixpkgs,
    ...
  }: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};

    profile = {
      name = "Andrew Garner";
      email = "andrew@andrewgarner.com";
      hostname = "andrewgarner";
      username = "andrewgarner";
    };

    specialArgs = {
      inherit profile;
    };
  in {
    darwinConfigurations.${profile.hostname} = darwin.lib.darwinSystem {
      inherit specialArgs system;

      modules = [
        ./nix
        ./system
        ./homebrew

        home-manager.darwinModules.home-manager
        {
          home-manager.extraSpecialArgs = specialArgs;
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${profile.username} = import ./home;
        }
      ];
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        lefthook
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
}
