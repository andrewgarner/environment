{config, ...}: {
  programs.mise = {
    enable = true;
  };

  xdg.configFile."mise/config.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/environment/home/mise/config.toml";
  };
}
