{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
    };

    casks = [
      "aerospace"
      "claude-code"
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
}
