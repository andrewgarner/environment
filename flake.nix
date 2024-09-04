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

    darwinConfiguration = profile:
      darwin.lib.darwinSystem {
        inherit system;

        specialArgs = {
          inherit profile;
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
      andrewgarner = darwinConfiguration {
        name = "Andrew Garner";
        email = "andrew@andrewgarner.com";
        hostname = "andrewgarner";
        username = "andrewgarner";
      };

      andrewgarner-glabs = darwinConfiguration {
        name = "Andrew Garner";
        email = "andrew@gradient-labs.ai";
        hostname = "andrewgarner-glabs";
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
