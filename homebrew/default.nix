{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
    };

    casks = [
      "aerospace"
      "docker"
      "elgato-camera-hub"
      "elgato-control-center"
      "font-jetbrains-mono-nerd-font"
      "fujitsu-scansnap-home"
      "ghostty"
      "gpg-suite"
      "jetbrains-toolbox"
      "logitech-options"
      "nikitabobko/tap/aerospace"
      "notion"
      "notion-calendar"
      "notion-mail"
      "raycast"
      "zed"
      "zoom"
    ];
  };

  programs.fish.shellInit = ''
    set -gx HOMEBREW_CELLAR "/opt/homebrew/Cellar";
    set -gx HOMEBREW_NO_ANALYTICS "1";
    set -gx HOMEBREW_NO_ENV_HINTS "1";
    set -gx HOMEBREW_PREFIX "/opt/homebrew";
    set -gx HOMEBREW_REPOSITORY "/opt/homebrew";

    fish_add_path -gP "/opt/homebrew/bin" "/opt/homebrew/sbin";

    ! set -q MANPATH; and set MANPATH ""; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
    ! set -q INFOPATH; and set INFOPATH ""; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
  '';
}
