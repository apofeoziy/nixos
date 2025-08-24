{
  virtualisation.libvirtd = {
    enable = true;
    onBoot = "ignore";
    onShutdown = "shutdown";
    qemu.ovmf.enable = true;
    qemu.runAsRoot = true;
    qemu.verbatimConfig = ''
      cgroup_device_acl = [
        "/dev/vfio/vfio",
        "/dev/kvm",
        "/dev/kvmfr0",
        "/dev/null"
      ]
    '';
  };
  programs.virt-manager.enable = true;
}
