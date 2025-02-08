{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
    };

    casks = [
      "docker"
      "elgato-camera-hub"
      "elgato-control-center"
      "font-jetbrains-mono-nerd-font"
      "fujitsu-scansnap-home"
      "gpg-suite"
      "jetbrains-toolbox"
      "logitech-options"
      "notion"
      "raycast"
      "warp"
      "zoom"
    ];
  };
}
