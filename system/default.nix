{
  pkgs,
  profile,
  specialArgs,
  ...
}: {
  environment = {
    shells = with pkgs; [
      fish
    ];

    systemPackages = with pkgs; [
      nil # Yet another language server for Nix
      nixd # Nix language server
      nixpkgs-fmt # Nix code formatter for nixpkgs
    ];
  };

  programs.fish.enable = true;
  security.pam.enableSudoTouchIdAuth = true;

  system.configurationRevision = specialArgs.configurationRevision;
  system.stateVersion = 5;

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
          AppleMenuBarVisibleInFullscreen = false;
        };

        NSWindow = {
          ShouldDragOnGesture = true;
        };
      };

      dock = {
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
