{
  programs.fish = {
    enable = true;

    shellAbbrs = {
      d = "docker";
      n = "nix";
      nfmt = "nix fmt";
    };

    shellInit = ''
      set --universal fish_greeting

      if test -e "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
        source "/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.fish"
      end
    '';
  };
}
