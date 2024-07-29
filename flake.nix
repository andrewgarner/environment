{
  description = "My home configuration";

  outputs = {nixpkgs, ...}: let
    forAllSystems = function:
      nixpkgs.lib.genAttrs nixpkgs.lib.systems.flakeExposed
      (system: function nixpkgs.legacyPackages.${system});
  in {
    devShell = forAllSystems (pkgs:
      pkgs.mkShell {
        buildInputs = [pkgs.lefthook];
      });

    formatter = forAllSystems (pkgs: pkgs.alejandra);
  };
}
