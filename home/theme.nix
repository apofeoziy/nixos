{ pkgs, config, lib, ...}: {
  home.pointerCursor = {
    package = pkgs.adwaita-icon-theme;
    name =  "Adwaita";
    size = 24;
    gtk.enable = true;
  };

  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
      };
      "org/gnome/desktop/wm/preferences" = {
        button-layout = "";
      };
    };
  };

  gtk = lib.mkForce {
    enable = true;
    theme = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
    font = {
      name = "JetBrainsMono";
      size = 11;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      package = pkgs.dracula-theme;
      name = "Dracula";
    };
  };
}
