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
      dock = {
        autohide = true;
        mineffect = "scale";
        minimize-to-application = true;
        persistent-apps = [
          "/Applications/Arc.app"
          "/System/Applications/Messages.app"
          "/Applications/Obsidian.app"
          "/Applications/Warp.app/"
          "/Applications/WebStorm.app"
          "/System/Applications/System Settings.app"
        ];
        persistent-others = [
          "/Users/${profile.username}/Downloads"
        ];
        show-process-indicators = false;
        show-recents = true;
      };

      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowScrollBars = "WhenScrolling";
        "com.apple.trackpad.scaling" = 3.0;
      };

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
