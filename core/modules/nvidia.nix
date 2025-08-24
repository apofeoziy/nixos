{ config, ... }: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    #extraPackages = [
    #  pkgs.nvidia-vaapi-driver
    #];
  };

  services.xserver.videoDrivers = ["nvidia"];
  nixpkgs.config.nvidia.acceptLicense = true;
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    open = true;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.latest;
  };

  #chaotic.mesa-git.enable = true;
}
