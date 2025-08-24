{
  pkgs,
  ...
}: {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "${pkgs.rofi-wayland}/share/rofi/themes/material.rasi";
    extraConfig = {
      show-icons = true;
      kb-cancel = "Escape,Super+space";
      modi = "run,drun,calc,window,ssh";
      sort = true;
      # levenshtein-sort = true;
    };
    plugins = [
      pkgs.rofi-calc
    ];
  };
}
