{ pkgs, ... }: {
  #hardware.opentabletdriver.enable = true;
  hardware.logitech.wireless.enable = true;
  hardware.keyboard.qmk.enable = true;
  hardware.xone.enable = true;
  hardware.sane.enable = true;
  services.printing = {
    enable = true;
    drivers = [
      #.gutenprint
      #pkgs.canon-capt
      pkgs.pantum-driver
    ];
    extraConf = ''
      <Location />
        Order allow,deny
        Allow all
      </Location>
      ...
      DefaultAuthType None
    '';
  };
  services.udev.extraHwdb = ''
    # Deco Pro LW Gen 2 Pen remaps
    evdev:input:b0005v28BDp0943*
        KEYBOARD_KEY_d0042=btn_left
        KEYBOARD_KEY_d0044=btn_middle
        KEYBOARD_KEY_d0045=btn_right
  '';
}
