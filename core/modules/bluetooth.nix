{
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.pipewire.wireplumber.extraConfig.bluetoothEnhancements = {
    "monitor.bluez.properties" = {
        "bluez5.enable-sbc-xq" = true;
        "bluez5.enable-msbc" = false;
        "bluez5.enable-hw-volume" = true; #hardware volume control
        "bluez5.auto-connect" = [ "a2dp_sink" ]; #driver used for autoconnect
        "bluez5.roles" = [ "a2dp_sink" "a2dp_source" ]; #look up the drivers for your BT, these will 'probably' work if you have HD headphones. The Handsfree mode that comes with headphones is.. glitchy. This setting disables that mono mode so the headset will always be in HD mode so you dont get shit audio playback quality if you activate a microphone.
    };
  };

   services.blueman.enable = true;
}
