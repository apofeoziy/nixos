{
  pkgs,
  ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    appeditor
    element-desktop
    whatsapp-for-linux
    ayugram-desktop
    (discord.override {
      withOpenASAR = false;
      withVencord = true;
    })
    galaxy-buds-client
    simple-scan
    bs-manager

    yandex-music
    youtube-music
    qbittorrent
    (vivaldi.override {
      proprietaryCodecs = true;
    })
    krita
    drawio
    obsidian
    (blender.override {
      #cudaSupport=true;
    })
    lunacy
    penpot-desktop
    postman
    via
    libreoffice-qt
    audacity
    hunspell
    hunspellDicts.ru_RU

    moonlight-qt
    parsec-bin
    lan-mouse
    input-remapper
    libinput
    evtest
    evtest-qt

    nautilus
    file-roller
    vlc
    loupe

    xdg-utils
    wl-clipboard
    cliphist
    grimblast
    hyprpicker
    pwvucontrol
    waybar-mpris
    playerctl
    brightnessctl
    networkmanagerapplet
    hyprpolkitagent
    hyprland-qtutils

    # dev tools
    jetbrains-toolbox
    rustc
    cargo
    gcc
    avalonia-ilspy
    beekeeper-studio
    zed-editor
    nixd
    pkg-config
    rustls-libssl
    jdk24
    wev
    nmap
    scrcpy

    # minecraft shenanigans
    prismlauncher
    glfw
  ];

  nixpkgs.overlays = [
    (self: super: {
      qt6Packages = super.qt6Packages.overrideScope (_: prev: {
        qt6gtk2 = prev.qt6gtk2.overrideAttrs (_: old: {
          version = "0.5-unstable-2025-03-04";
          src = self.fetchFromGitLab {
            domain = "opencode.net";
            owner  = "trialuser";
            repo   = "qt6gtk2";
            rev    = "d7c14bec2c7a3d2a37cde60ec059fc0ed4efee67";
            hash   = "sha256-6xD0lBiGWC3PXFyM2JW16/sDwicw4kWSCnjnNwUT4PI=";
          };
        });
      });
    })
    (self: super: {
      beekeeper-studio = super.beekeeper-studio.overrideAttrs (old: {
        buildInputs = (old.buildInputs or []) ++ [ pkgs.krb5 ];
        meta = old.meta // {
          knownVulnerabilities = [];
        };
      });
    })
  ];
}
