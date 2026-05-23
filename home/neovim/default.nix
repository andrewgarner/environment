{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withRuby = false;
    withPython3 = false;
  };

  home.packages = with pkgs; [
    fd # Used by Telescope
    ripgrep # Used by Telescope
  ];

  home.shellAliases = {
    vi = "nvim";
    vim = "nvim";
  };

  xdg.configFile."nvim" = {
    recursive = true;
    source = ./config;
  };
}
