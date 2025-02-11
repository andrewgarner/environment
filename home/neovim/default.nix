{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.packages = with pkgs; [
    fd # Used by Telescope
    ripgrep # Used by Telescope
  ];

  xdg.configFile."nvim" = {
    recursive = true;
    source = ./config;
  };
}
