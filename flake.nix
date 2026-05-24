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
      url = "https://flakehub.com/f/nix-community/home-manager/0";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { self, ... }@inputs:
    let
      system = "aarch64-darwin";
      pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ self.overlays.default ];
      };

      darwinConfiguration =
        profile:
        inputs.darwin.lib.darwinSystem {
          inherit system;

          specialArgs = {
            inherit profile;
            configurationRevision = self.rev or self.dirtyRev or null;
          };

          modules = [
            inputs.determinate.darwinModules.default
            self.darwinModules.system
            self.darwinModules.brewCommon
            self.darwinModules.brewPersonal

            inputs.home-manager.darwinModules.home-manager
            {
              home-manager = {
                extraSpecialArgs = { inherit profile; };
                useGlobalPkgs = true;
                useUserPackages = true;
                users.${profile.username} = import ./home/personal.nix;
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

      darwinModules = {
        system = import ./darwin/system.nix;
        brewCommon = import ./darwin/homebrew-common.nix;
        brewPersonal = import ./darwin/homebrew-personal.nix;
        brewWork = import ./darwin/homebrew-work.nix;
      };

      homeModules = {
        default = import ./home;
      };

      overlays.default = _final: prev: {
        lib = prev.lib // {
          homeDirectory =
            username: if prev.stdenv.isDarwin then "/Users/${username}" else "/home/${username}";
        };
      };

      devShells.${system}.default = pkgs.mkShellNoCC {
        packages = with pkgs; [
          commitlint-rs
          lefthook
          self.formatter.${system}
        ];
      };

      formatter.${system} = pkgs.nixfmt;
    };
}
