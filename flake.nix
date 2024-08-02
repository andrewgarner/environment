{
  description = "My home configuration";

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
