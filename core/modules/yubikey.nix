{ pkgs, ... }: {
  environment.systemPackages = [
    pkgs.yubioath-flutter
    pkgs.python313Packages.pyscard
  ];
  services.pcscd.enable = true;
  services.udev.packages = [ pkgs.yubikey-personalization ];
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
