{
  lib,
  config,
  pkgs,
  ...
}:
let
  toml = pkgs.formats.toml { };
in
{
  options.programs.mise.managedConfig = {
    tools = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
    };
  };

  config = {
    programs.mise = {
      enable = true;
    };

    programs.mise.managedConfig.tools = {
      commitlint-rs = "latest";
      lefthook = "latest";
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

    xdg.configFile."mise/config.toml".source = toml.generate "mise-config.toml" {
      tools = config.programs.mise.managedConfig.tools;
    };
  };
}
