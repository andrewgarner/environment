{
  homebrew = {
    enable = true;

    onActivation = {
      autoUpdate = false;
    };

    casks = [
      "claude-code"
      "docker"
      "font-jetbrains-mono-nerd-font"
      "ghostty"
      "gpg-suite"
      "jetbrains-toolbox"
      "logitech-options"
      "nikitabobko/tap/aerospace"
      "raycast"
      "zed"
      "zoom"
    ];
  };
}
