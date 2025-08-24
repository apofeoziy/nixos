{
  ...
}: {
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/markdown" = "dev.zed.Zed.desktop";
        "text/plain" = "dev.zed.Zed.desktop";
        "x-scheme-handler/http" = "vivaldi";
        "x-scheme-handler/https" = "vivaldi";
        "text/html" = "vivaldi";
        "application/pdf" = "vivaldi";
        "inode/directory" = "org.gnome.Nautilus.desktop";
        "video/mp4" = "vlc.desktop";
        "video/x-matroska" = "vlc.desktop";
        "image/jpeg" = "org.gnome.Loupe.desktop";
        "image/png" = "org.gnome.Loupe.desktop";
        "image/gif" = "org.gnome.Loupe.desktop";
      };
    };
  };
}
