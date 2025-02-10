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

  programs.home-manager.enable = true;
}
