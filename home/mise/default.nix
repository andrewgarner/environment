{config, ...}: {
  programs.mise = {
    enable = true;
  };

  programs.fish.shellAbbrs = {
    m = "mise";
    ma = "mise alias";
    mb = "mise backends";
    mcfg = "mise config";
    mdr = "mise doctor";
    me = "mise env";
    mfmt = "mise fmt";
    mi = "mise install";
    mln = "mise link";
    mls = "mise list";
    mps = "mise plugins";
    mr = "mise run";
    mrm = "mise unuse";
    msh = "mise shell";
    mt = "mise tasks";
    mu = "mise use";
    mup = "mise upgrade";
    mw = "mise watch";
    mx = "mise exec --";
  };

  xdg.configFile."mise/config.toml" = {
    source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/code/environment/home/mise/config.toml";
  };
}
