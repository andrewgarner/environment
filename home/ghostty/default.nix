{config, ...}: {
  xdg.configFile."ghostty/config" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/environment/home/ghostty/config";
  };

  programs.fish.shellInit = ''
    if set -q GHOSTTY_RESOURCES_DIR
      source "$GHOSTTY_RESOURCES_DIR/shell-integration/fish/vendor_conf.d/ghostty-shell-integration.fish"
    end
  '';
}
