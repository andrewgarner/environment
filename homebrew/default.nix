{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
    };

    brews = [
      "encore"
      "graphite"
    ];

    casks = [
      "arc"
      "chatgpt"
      "cursor"
      "docker"
      "elgato-camera-hub"
      "elgato-control-center"
      "font-jetbrains-mono-nerd-font"
      "fujitsu-scansnap-home"
      "gpg-suite"
      "jetbrains-toolbox"
      "logitech-options"
      "obsidian"
      "raycast"
      "visual-studio-code"
      "warp"
      "zoom"
    ];

    taps = [
      "encoredev/tap"
      "withgraphite/tap"
    ];
  };
}
