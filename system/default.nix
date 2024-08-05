{
  pkgs,
  profile,
  ...
}: {
  environment = {
    shells = with pkgs; [
      fish
    ];
  };

  networking = {
    computerName = profile.hostname;
    hostName = profile.hostname;
  };

  programs.fish.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    activationScripts.postUserActivation.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      dock.autohide = true;
      dock.mineffect = "scale";
      dock.minimize-to-application = true;
      dock.persistent-apps = [
        "/Applications/Arc.app"
        "/System/Applications/Messages.app"
        "/Applications/Obsidian.app"
        "/Applications/Warp.app/"
        "/Applications/WebStorm.app"
        "/System/Applications/System Settings.app"
      ];

      dock.persistent-others = [
        "/Users/${profile.username}/Downloads"
      ];

      dock.show-process-indicators = false;
      dock.show-recents = true;

      NSGlobalDomain.AppleInterfaceStyle = "Dark";
      NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";
      NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;

      smb.NetBIOSName = profile.hostname;
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
  };

  users.users.${profile.username} = {
    home = "/Users/${profile.username}";
    description = profile.name;
  };
}
