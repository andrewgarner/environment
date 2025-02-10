{pkgs, ...}: {
  programs.neovim = {
    enable = true;

    defaultEditor = true;
    extraLuaConfig = builtins.readFile ./init.lua;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

  home.packages = with pkgs; [
    fd # Used by Telescope
    ripgrep # Used by Telescope
  ];

  xdg.configFile."nvim/lua" = {
    recursive = true;
    source = ./lua;
  };
}
