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

    defaults.smb.NetBIOSName = profile.hostname;
  };

  users.users.${profile.username} = {
    home = "/Users/${profile.username}";
    description = profile.name;
  };
}
