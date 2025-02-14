{config, ...}: {
  xdg.configFile."aerospace/aerospace.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/environment/home/aerospace/aerospace.toml";
  };
}
