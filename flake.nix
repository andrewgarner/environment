{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-24.11-darwin";

    darwin = {
      url = "github:LnL7/nix-darwin/nix-darwin-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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

    darwinConfiguration = profile:
      darwin.lib.darwinSystem {
        inherit system;

        specialArgs = {
          inherit profile;
          configurationRevision = self.rev or self.dirtyRev or null;
        };

        modules = [
          ./nix
          ./system
          ./homebrew

          home-manager.darwinModules.home-manager
          {
            home-manager = {
              extraSpecialArgs = {
                inherit profile;
              };
              useGlobalPkgs = true;
              useUserPackages = true;
              users.${profile.username} = import ./home;
            };
          }
        ];
      };
  in {
    darwinConfigurations = {
      personal = darwinConfiguration {
        name = "Andrew Garner";
        email = "andrew@andrewgarner.com";
        username = "andrewgarner";
      };
    };

    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        lefthook
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
}
