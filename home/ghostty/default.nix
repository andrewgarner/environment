{config, ...}: {
  xdg.configFile."ghostty/config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/environment/home/ghostty/config";
  };
}
