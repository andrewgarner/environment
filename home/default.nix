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
    ./aws.nix
    ./direnv.nix
    ./fish.nix
    ./git.nix
    ./jq.nix
    ./neovim.nix
    ./starship.nix
    ./tmux.nix
  ];

  programs.home-manager.enable = true;
}
