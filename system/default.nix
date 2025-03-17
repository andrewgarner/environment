{
  pkgs,
  profile,
  specialArgs,
  ...
}: {
  # Disable Nix as we're using Determinate (https://determinate.systems/posts/nix-darwin-updates/
  nix.enable = false;

  # Set system state version
  system.stateVersion = 5;

  # Set system configuration revision
  system.configurationRevision = specialArgs.configurationRevision;

  # Run settings activation script after user activation
  system.activationScripts.postUserActivation.text = ''
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
  '';

  # Set user configuration (home directory and full name)
  users.users.${profile.username} = {
    home = "/Users/${profile.username}";
    description = profile.name;
  };

  # Add Fish shell to available shells
  environment.shells = [pkgs.fish];

  # Enable Fish as the default shell
  programs.fish.enable = true;

  # Enable Touch ID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  # Enable keyboard mapping
  system.keyboard.enableKeyMapping = true;

  # Remap Caps Lock to Control key
  system.keyboard.remapCapsLockToControl = true;

  # Set trackpad sensitivity/speed to 3.0
  system.defaults.NSGlobalDomain."com.apple.trackpad.scaling" = 3.0;

  # Set dark mode interface
  system.defaults.NSGlobalDomain.AppleInterfaceStyle = "Dark";

  # Show scrollbars only when scrolling
  system.defaults.NSGlobalDomain.AppleShowScrollBars = "WhenScrolling";

  # Disable window animations
  system.defaults.NSGlobalDomain.NSAutomaticWindowAnimationsEnabled = false;

  # Hide menu bar in fullscreen mode
  system.defaults.CustomUserPreferences.NSGlobalDomain.AppleMenuBarVisibleInFullscreen = false;

  # Enable window dragging with gestures
  system.defaults.NSGlobalDomain.NSWindowShouldDragOnGesture = true;

  # Flash date separators in menu bar clock
  system.defaults.menuExtraClock.FlashDateSeparators = true;

  # Disable ⌘Space for Spotlight search
  system.defaults.CustomUserPreferences."com.apple.symbolichotkeys".AppleSymbolicHotKeys."64".enabled = false;

  # Auto-hide the dock
  system.defaults.dock.autohide = true;

  # Group app windows together in Mission Control
  system.defaults.dock.expose-group-apps = true;

  # Use scale effect for minimizing windows
  system.defaults.dock.mineffect = "scale";

  # Minimize windows to their application icon
  system.defaults.dock.minimize-to-application = true;

  # Hide app indicators in dock
  system.defaults.dock.show-process-indicators = false;

  # Hide recent applications in dock
  system.defaults.dock.show-recents = false;

  # Show only open applications in the Dock
  system.defaults.dock.static-only = true;

  # Set persistent folders in dock
  system.defaults.dock.persistent-others = [
    "/Users/${profile.username}/Downloads"
  ];

  # Sort folders first in Finder
  system.defaults.finder._FXSortFoldersFirst = true;
}
