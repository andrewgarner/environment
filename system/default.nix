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

  programs.fish.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  system = {
    activationScripts.postUserActivation.text = ''
      /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
    '';

    defaults = {
      CustomUserPreferences = {
        "com.apple.symbolichotkeys" = {
          AppleSymbolicHotKeys = {
            "64" = {
              # ⌘Space - Show Spotlight search
              enabled = false;
            };
          };
        };

        NSGlobalDomain = {
          AppleMenuBarVisibleInFullscreen = true;
        };
      };

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
