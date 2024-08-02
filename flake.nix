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
    pkgs = nixpkgs.legacyPackages.aarch64-darwin;
  in {
    devShells.aarch64-darwin.default = pkgs.mkShell {
      packages = with pkgs; [
        lefthook
      ];
    };

    formatter.aarch64-darwin = pkgs.alejandra;

    homeConfigurations.andrewgarner = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [./home.nix];
    };
  };
}
