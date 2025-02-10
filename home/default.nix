{
  pkgs,
  profile,
  ...
}: {
  home = {
    username = profile.username;
    homeDirectory = "/Users/" + profile.username;

    packages = with pkgs; [
      fh
    ];

    stateVersion = "24.05";
  };

  imports = [
    ./aws
    ./direnv
    ./fish
    ./ghostty
    ./git
    ./jq
    ./neovim
    ./starship
    ./tmux.nix
    ./zed.nix
  ];

  programs.home-manager.enable = true;
}
