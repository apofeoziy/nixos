{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    mangohud
    protonup-qt
    bottles
    heroic
    (lutris.override {
      extraLibraries =  pkgs: [
          # List library dependencies here
      ];
    })
  ];
  programs = {
    gamemode.enable = true;
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    steam = let
        oldpkgs = import (builtins.fetchTarball {
            url = "https://github.com/NixOS/nixpkgs/archive/79b3d4bcae8c7007c9fd51c279a8a67acfa73a2a.tar.gz";
            sha256 = "sha256:1lsrlgx4rg2wqxrz5j7kzsckgk4ymvr1l77rbqm1zxap6hg07dxf";
        }) { inherit (pkgs) system; };
    in {
      extraPackages = with pkgs; [
        oldpkgs.libtiff
        nss
        xorg.libSM
        xorg.libxkbfile
        xorg.libxcb
        xorg.xcbutilwm
        xorg.xcbutilimage
        xorg.xcbutilkeysyms
        xorg.xcbutilrenderutil
        xcb-util-cursor
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
      enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
      localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
    };
  };
}
