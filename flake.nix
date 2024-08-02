{
  description = "My home configuration";

  inputs = {
    home-manager = {
      url = "https://flakehub.com/f/nix-community/home-manager/0.2405.3571.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2405.633614.tar.gz";
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: let
    system = "aarch64-darwin";
    pkgs = nixpkgs.legacyPackages.${system};

    profile = {
      name = "Andrew Garner";
      email = "andrew@andrewgarner.com";
      username = "andrewgarner";
    };
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        lefthook
      ];
    };

    formatter.${system} = pkgs.alejandra;

    homeConfigurations.${profile.username} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      extraSpecialArgs = {
        inherit profile;
      };

      modules = [./home.nix];
    };
  };
}
