{ config, ... }:
{
  home.file.".claude/settings.json" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Code/environment/home/claude/settings.json";
  };
}
