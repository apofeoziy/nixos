# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ ... }: {
  imports = [ # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./packages.nix
    ./bundle.nix
    ./disko.nix
  ];

  services.gvfs.enable = true;
  services.fstrim.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  networking.networkmanager.enable = true;

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [
        "https://cache.garnix.io"
        "https://hyprland.cachix.org"
        "https://nix-community.cachix.org"
        "https://cuda-maintainers.cachix.org"
      ];
      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };
  };

  # work smart not hard :skull_emoji:
  #hardware.opengl.enable = true;


  security.sudo.extraConfig = ''
    Defaults pwfeedback
  '';

  networking.hostName = "workstation";
  networking.firewall.checkReversePath = false;

  time.timeZone = "Europe/Moscow";

  i18n.defaultLocale = "ru_RU.UTF-8";

  system.stateVersion = "24.11"; # DO NOT CHANGE.
}
