{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
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
        commitlint-rs
        lefthook
      ];
    };

    formatter.${system} = pkgs.alejandra;
  };
}
