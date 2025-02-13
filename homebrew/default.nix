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
      "raycast"
      "zed"
      "zoom"
    ];
  };
}
