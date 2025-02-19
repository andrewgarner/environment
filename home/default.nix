{
  pkgs,
  profile,
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = profile.username;
  home.homeDirectory = "/Users/" + profile.username;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fh # FlakeHub
    nil # Yet another language server for Nix
    nixd # Nix language server
    nixpkgs-fmt # Nix code formatter for nixpkgs
  ];

  home.sessionVariables = {
    PAGER = "less -FirSwX";
  };

  # This value determines the Home Manager release that this
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  home.stateVersion = "24.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  imports = [
    (import ./aerospace)
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
