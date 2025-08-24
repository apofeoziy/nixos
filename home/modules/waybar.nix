{ pkgs, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainMonitor = {
        layer = "top";
        position = "top";
        output = "HDMI-A-1";
        margin = "10 20 -10 20";

        modules-left = ["hyprland/workspaces"];
        modules-center = ["hyprland/window"];

        "hyprland/window" = {
          icon = true;
          icon-size = 16;
          max-length = 60;
        };

        "custom/waybar-mpris" = {
          return-type = "json";
          exec = "waybar-mpris --position --play  --pause  --order SYMBOL:ARTIST:TITLE";
          on-click = "waybar-mpris --send toggle";
          on-click-right = "waybar-mpris --send player-next";
          on-scroll-up = "waybar-mpris --send next";
          on-scroll-down = "waybar-mpris --send prev";
          escape = true;
          max-length = 100;
        };
        #modules-right = [];
      };
      dataMonitor = {
        layer = "top";
        position = "top";
        output = "DP-2";
        margin = "10 20 -10 20";

        modules-left = ["clock" "hyprland/language" "hyprland/workspaces"];
        modules-right = ["pulseaudio" "memory" "cpu" "tray"];

        # LEFT

        "clock" = {
          format = "{:L%a %d %b | %H:%M:%S}";
          interval = 1;
        };

        "hyprland/language" = {
          format = "{short}";
          min-length = 3;
          #tooltip = false;
        };

        # CENTER

        "hyprland/window" = {
          icon = true;
          icon-size = 16;
          max-length = 60;
        };

        # RIGHT

        "pulseaudio" = {
          reverse-scrolling = 0;
          #format = "{volume}% {icon} {format_source}";
          #format-bluetooth = "{volume}% {icon}  {format_source}";
          #format-bluetooth-muted = " {icon}  {format_source}";
          #format-muted = " {format_source}";
          format = "{format_source} {volume}% {icon}";
          format-bluetooth = "{format_source} {volume}% {icon} ";
          format-bluetooth-muted = "{format_source}  {icon} ";
          format-muted = "{format_source} ";
          format-source = "󰍬";
          format-source-muted = "󰍭";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pwvucontrol";
          #min-length = 13;
        };

        "memory" = {
          format = "{used:0.1f}G ";
          interval = 3;
        };

        "cpu" = {
          interval = 2;
          format = "{usage}% ";
          min-length = 6;
        };

        "tray" = {
          icon-size = 16;
          spacing = 1;
        };
      };
    };

    style = ''
      * {
        border: none;
        border-radius: 0;
        /* `otf-font-awesome` is required to be installed for icons */
        font-family: JetBrains Mono;
        font-weight: bold;
        min-height: 20px;
      }

      window#waybar {
          background: transparent;
      }

      window#waybar.hidden {
          opacity: 0.2;
      }

      #clock {
        margin-left: 4px;
        transition: none;
        color: white;
        background: transparent;
      }

      #language {
        margin-left: 12px;
        transition: none;
        color: white;
        background: transparent;
      }

      #workspaces {
        margin-left: 6px;
        border-radius: 10px;
        transition: none;
        background: transparent;
      }

      #workspaces button {
        transition: none;
        color: white;
        background: transparent;
        padding: 5px;
        font-size: 18px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          border-radius: inherit;
          color: white;
          background: #1a1a1a; /* #8c6f2e */
      }

      #workspaces button.active {
        background: #1f1f1f; /* #E7BF64 */
        color: white;
        border-radius: inherit;
      }

      #custom-waybar-mpris {
        color: white;
      }

      #pulseaudio {
        margin-right: 14px;
        transition: none;
        color: white;
        background: transparent;
      }

      #memory {
        margin-right: 4px;
        transition: none;
        color: white;
        background: transparent;
      }

      #cpu {
        margin-right: 8px;
        transition: none;
        color: white;
        background: transparent;
      }

      #tray {
        margin-right: 8px;
        transition: none;
        color: white;
        background: transparent;
      }

      #backlight {
        margin-right: 8px;
        transition: none;
        color: white;
        background: transparent;
      }

      #battery {
        margin-right: 4px;
        transition: none;
        color: white;
        background: transparent;
      }
    '';
  };

  # alacritty
  programs.alacritty = {
    enable = true;
    package = pkgs.alacritty;
    settings = {
      window.opacity = 0.45;

      font = {
        size = 13.0;
        # draw_bold_text_with_bright_colors = true;
        normal = {
          family = "JetBrains Mono";
          style = "Bold";
        };
      };

      colors.primary.background = "#1d2021";
    };
  };
}
