{ pkgs, ... }: let
    soundDir = "~/nix/sound";
in {
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    pulse.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    jack.enable = true;
  };

  services.udev.extraRules = ''
    ACTION=="add", SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", RUN+="${pkgs.su}/bin/su destony -c 'XDG_RUNTIME_DIR=/run/user/1000 pw-play ${soundDir}/add.mp3"
    ACTION=="remove", SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", RUN+="${pkgs.su}/bin/su destony -c 'XDG_RUNTIME_DIR=/run/user/1000 pw-play ${soundDir}/remove.mp3"
  '';
}
