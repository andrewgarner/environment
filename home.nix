{
  home = {
    username = "andrewgarner";
    homeDirectory = "/Users/andrewgarner";
    stateVersion = "24.05";
  };

  imports = [
    ./aws.nix
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./jq.nix
    ./starship.nix
  ];

  programs.home-manager.enable = true;
}
