{
  config,
  pkgs,
  ...
}:
#let
#  v4l2loopback_0_13_2 = config.boot.kernelPackages.v4l2loopback.overrideAttrs (old: {
#    version = "0.13.2-manual";
#    src = pkgs.fetchFromGitHub {
#      owner = "umlaeute";
#      repo  = "v4l2loopback";
#      rev   = "v0.13.2";
#      hash  = "sha256-rcwgOXnhRPTmNKUppupfe/2qNUBDUqVb3TeDbrP5pnU=";
#    };
#  });
#in
{
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
    kernelPackages = pkgs.linuxPackages_zen;
    kernelParams = [
      "amd_pstate=active"
      "amd_iommu=on"
      "iommu=pt"
    ];
    kernelModules = [
      "kvm-amd"
      "vfio_virqfd"
      "vfio_pci"
      "vfio_iommu_type1"
      "vfio"
      #"v4l2loopback"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      #v4l2loopback_0_13_2
    ];
    kernel.sysctl = {
      # SteamOS/Fedora default, can help with performance.
      "vm.max_map_count" = 2147483642;
    };
  };
  #.extraModprobeConfig = ''
  #  options v4l2loopback devices=1 video_nr=1 card_label="OBS Cam" exclusive_caps=1
  #'';
  security.polkit.enable = true;
}
