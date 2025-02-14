{config, ...}: {
  xdg.configFile."zed/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/environment/home/zed/settings.json";
  };
}
