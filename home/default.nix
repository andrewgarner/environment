{
  pkgs,
  profile,
  ...
}:
{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = profile.username;
  home.homeDirectory = "/Users/" + profile.username;

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    fh # FlakeHub
    nil # Yet another language server for Nix
    nixd # Nix language server
    nixfmt # Nix code formatter (RFC style)
    nixpkgs-fmt # Nix code formatter for nixpkgs
  ];

  home.sessionVariables = {
    HOMEBREW_PREFIX = "/opt/homebrew";
    HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
    HOMEBREW_REPOSITORY = "/opt/homebrew";
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_NO_ENV_HINTS = "1";
    DO_NOT_TRACK = "1";
    FLAKE_CHECKER_NO_TELEMETRY = "true";
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
    (import ./claude)
    (import ./fish)
    (import ./ghostty)
    (import ./git)
    (import ./jq)
    (import ./mise)
    (import ./neovim)
    (import ./starship)
    (import ./tmux)
    (import ./vscode)
    (import ./zed)
  ];
}
