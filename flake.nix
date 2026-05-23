{
  description = "My development environment";

  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0";

    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "https://flakehub.com/f/nix-darwin/nix-darwin/0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      determinate,
      darwin,
      home-manager,
      nixpkgs,
      ...
    }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};

      darwinConfiguration =
        profile:
        darwin.lib.darwinSystem {
          inherit system;

          specialArgs = {
            inherit profile;
            configurationRevision = self.rev or self.dirtyRev or null;
          };

          modules = [
            determinate.darwinModules.default
            ./darwin

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
    in
    {
      darwinConfigurations = {
        personal = darwinConfiguration {
          name = "Andrew Garner";
          email = "andrew@andrewgarner.com";
          username = "andrewgarner";
        };
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          commitlint-rs
          lefthook
        ];
      };

      formatter.${system} = pkgs.nixfmt;
    };
}
