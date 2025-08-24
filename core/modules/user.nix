{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.bash;

    users.destony = {
      isNormalUser = true;
      shell = pkgs.zsh;
      extraGroups = [ "wheel" "input" "plugdev" "adbusers" "libvirtd" "kvm" "adbusers" ];
    };
  };

  # Enable automatic login for the user.
  # services.getty.autologinUser = "destony";
}
