{
  pkgs,
  profile,
  specialArgs,
  ...
}: {
  nix.enable = false;

  users.users.${profile.username} = {
    home = "/Users/${profile.username}";
    description = profile.name;
  };

  environment.shells = [pkgs.fish];
  programs.fish.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  system.configurationRevision = specialArgs.configurationRevision;
  system.stateVersion = 5;

  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };

  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  system.defaults.CustomUserPreferences = {
    "com.apple.symbolichotkeys" = {
      AppleSymbolicHotKeys = {
        "64" = {
          # ⌘Space - Show Spotlight search
          enabled = false;
        };
      };
    };

    NSAutomatic.WindowAnimationsEnabled = false;
    NSGlobalDomain.AppleMenuBarVisibleInFullscreen = false;
    NSWindow.ShouldDragOnGesture = true;
  };

  system.defaults.dock = {
    autohide = true;
    mineffect = "scale";
    minimize-to-application = true;
    persistent-apps = [
      "/System/Cryptexes/App/System/Applications/Safari.app"
      "/System/Applications/Messages.app"
      "/System/Applications/System Settings.app"
    ];
    persistent-others = [
      "/Users/${profile.username}/Downloads"
    ];
    show-process-indicators = false;
    show-recents = true;
  };

  system.defaults.NSGlobalDomain = {
    AppleInterfaceStyle = "Dark";
    AppleShowScrollBars = "WhenScrolling";
    "com.apple.trackpad.scaling" = 3.0;
  };
}
