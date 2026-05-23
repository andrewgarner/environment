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

      fish_add_path -gP "/opt/homebrew/bin" "/opt/homebrew/sbin";

      ! set -q MANPATH; and set MANPATH ""; set -gx MANPATH "/opt/homebrew/share/man" $MANPATH;
      ! set -q INFOPATH; and set INFOPATH ""; set -gx INFOPATH "/opt/homebrew/share/info" $INFOPATH;
    '';
  };
}
