{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
    };

    brews = [
      "withgraphite/tap/graphite"
    ];

    casks = [
      "docker"
      "elgato-camera-hub"
      "elgato-control-center"
      "font-jetbrains-mono-nerd-font"
      "fujitsu-scansnap-home"
      "gpg-suite"
      "jetbrains-toolbox"
      "logitech-options"
      "raycast"
      "visual-studio-code"
      "warp"
      "zoom"
    ];

    taps = [
      "withgraphite/tap"
    ];
  };
}
