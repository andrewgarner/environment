{pkgs, ...}: {
  xdg.configFile."zed/settings.json".text = builtins.readFile ./zed/settings.json;

  home.packages = [
    pkgs.nixd # Nix language server
  ];
}
