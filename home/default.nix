{
  pkgs,
  profile,
  ...
}: {
  programs.home-manager.enable = true;

  home = {
    stateVersion = "24.11";

    homeDirectory = "/Users/" + profile.username;
    username = profile.username;

    packages = with pkgs; [
      fh # FlakeHub
    ];
  };

  imports = [
    (import ./aws)
    (import ./direnv)
    (import ./fish)
    (import ./ghostty)
    (import ./git)
    (import ./jq)
    (import ./neovim)
    (import ./starship)
    (import ./tmux)
    (import ./zed)
  ];
}
