{
  pkgs,
  profile,
  ...
}:
{
  home.username = profile.username;
  home.homeDirectory = "/Users/" + profile.username;

  home.packages = with pkgs; [
    fh
    nil
    nixd
    nixfmt
    nixpkgs-fmt
  ];

  home.sessionVariables = {
    DO_NOT_TRACK = "1";
    FLAKE_CHECKER_NO_TELEMETRY = "true";
    HOMEBREW_CELLAR = "/opt/homebrew/Cellar";
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_NO_ENV_HINTS = "1";
    HOMEBREW_PREFIX = "/opt/homebrew";
    HOMEBREW_REPOSITORY = "/opt/homebrew";
    PAGER = "less -FirSwX";
  };

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;

  imports = [
    (import ./aerospace)
    (import ./claude/common.nix)
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
