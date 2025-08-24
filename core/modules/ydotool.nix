{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.ydotool
  ];
  security.sudo.extraRules = [
    {
      groups = [ "wheel" ];
      commands = [
        { command = "/run/current-system/sw/bin/ydotoold"; options = [ "NOPASSWD" ]; }
        { command = "/run/current-system/sw/bin/ydotool"; options = [ "NOPASSWD" ]; }
      ];
    }
  ];
}
