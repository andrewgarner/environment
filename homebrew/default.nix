{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
      cleanup = "zap";
    };

    casks = [
      "arc"
      "chatgpt"
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
  };
}
