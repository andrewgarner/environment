{
  pkgs,
  profile,
  ...
}: {
  home = {
    username = profile.username;
    homeDirectory = "/Users/" + profile.username;

    file.brewfile = {
      target = "Brewfile";
      source = ./homebrew/Brewfile;
    };

    packages = with pkgs; [
      fh
    ];

    stateVersion = "24.05";
  };

  imports = [
    ./aws
    ./direnv
    ./fish
    ./git
    ./jq
    ./starship
  ];

  programs.home-manager.enable = true;
}
