{
  ...
}: {
  programs.hyprlock = {
    enable = false;
    settings = {
      hide_cursor = true;
      background = [
        {
          monitor = "eDP-1";
          path = "/home/destony/wallpaper.png";

          blur_passes = 1; # 0 disables blurring
          blur_size = 7;
        }
      ];

      label = [
        {
          monitor = "eDP-1";
          text = "$TIME";
          color = "rgb(244, 191, 117)";
          font_size = 95;
          font_family = "JetBrains Mono";
          position = "0, 200";
          halign = "center";
          valign = "center";
        }
        {
          monitor = "eDP-1";
          text = ''cmd[update:1000] echo $(date +"%A, %B %d")'';
          color = "rgb(244, 191, 117)";
          font_size = 22;
          font_family = "JetBrains Mono";
          position = "0, 100";
          halign = "center";
          valign = "center";
        }
      ];

      input-field = {
        monitor = "eDP-1";
        size = "550,100";
        outline_thickness = 2;
        dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.35; # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true;
        outer_color = "rgba(0, 0, 0, 0)";
        inner_color = "rgba(0, 0, 0, 0.6)";
        fade_on_empty = false;
        rounding = 15;
        font_color = "rgb(255,255,255)";
        check_color = "rgb(244, 210, 46)";
        placeholder_text = ''<span foreground="##F4BF75">Че пялишь, вводи давай</span>'';
        fail_text = ''<span foreground="##F4BF75">НЕПРАВИЛЬНО!!!</span>'';
        font_family = "JetBrains Mono";
        hide_input = false;
        position = "0, 0";
        halign = "center";
        valign = "center";
      };
    };
  };
}
