{
  inputs,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    systemd.enable = false;
    plugins = [
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
      inputs.hyprspace.packages.${pkgs.system}.Hyprspace
    ];

    extraConfig = ''
      monitorv2 {
        output=HDMI-A-1
        mode=3840x2160@139.99
        position=1080x0
        scale=2
        bitdepth=8
        cm=srgb
        sdrbrightness=1.0
        sdrsaturation=1.0
        supports_wide_color=1
        supports_hdr=1
        sdr_min_luminance=0.005
        sdr_max_luminance=125
        min_luminance=0
        max_luminance=1000
        max_avg_luminance=200
      }
    '';

    settings = {
      "$mainMod" = "SUPER";

      monitor = [
        #"DP-2, disabled"
        "DP-2,     1920x1080@74.97,  0x0,   1,transform,3"
        #"HDMI-A-1, 3840x2160@139.99, 1080x0, 2, bitdepth, 10, cm, hdr, sdrbrightness, 1.0, sdrsaturation, 1.0"
        #"HDMI-A-1, 2880x1800@139.99, 0x0, 2"
        #"HDMI-A-1, 3840x2160@139.99, 1080x0, 2"
      ];

      workspace = [
        #"name:11, monitor:DP-2"
      ];

      xwayland = {
        force_zero_scaling = true;
      };

      env = [
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "NIXOS_OZONE_WL,1"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "GDK_SCALE,2"
        #"QT_SCREEN_SCALE_FACTORS,2"
        "XCURSOR_SIZE,24"
        "NVD_BACKEND,direct"
        "LIBVA_DRIVER_NAME,nvidia"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = false;
      };

      #cursor.no_warps = true;
      input = {
        kb_layout = "us,ru";
        kb_options = "grp:caps_toggle,fkeys:basic_13-24";
        numlock_by_default = true;
        follow_mouse = 1;
        #natural_scroll = true;
        #scroll_factor = 0.7;
        #sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
        touchpad = {
          disable_while_typing = false;
        };
        tablet = {
          output = "HDMI-A-1";
          relative_input = false;
        };
      };

      #cursor = {
      #  no_hardware_cursors = true;
      #};

      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 0;
        #"col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
        #"col.inactive_border" = "rgba(FAC367aa)";
        "col.active_border" = "rgba(F6CC6Aee) rgba(FDAD62ee) 45deg";
        "col.inactive_border" = "rgba(595959aa)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 3;
        rounding_power = 4.0;

        blur = {
          enabled = false;
          size = 3;
          passes = 3;
          new_optimizations = true;
        };

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        # bezier = "myBezier, 0.33, 0.82, 0.9, -0.08";

        animation = [
          "windows,     1, 7,  myBezier"
          "windowsOut,  1, 7,  default, popin 80%"
          "windowsMove, 1, 3,  default"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      master = {
        new_status = true;
        allow_small_split = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = true;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
        background_color = 000000;
        enable_anr_dialog = false;
        vfr = true;
        #focus_on_activate = true;
      };

      opengl = {
        #nvidia_anti_flicker = false;
      };

      debug = {
        #damage_tracking = 0;
      };

      windowrule = [
        "float, class:(PenTablet)"
        "float, class:(imv)"
        "float, class:(mpv)"
        "float, class:(org.gnome.Nautilus)"
        "size 800 600, class:(org.gnome.Nautilus)"
        "float, class:(org.gnome.FileRoller)"
        "float, class:(com.saivert.pwvucontrol)"
        "size 1040 500, class:(com.saivert.pwvucontrol)"
        "move 20 55, class:(com.saivert.pwvucontrol)"
        "pin, class:(com.saivert.pwvucontrol)"
        "float, class:(.blueman-manager-wrapped)"
        "size 1040 500, class:(.blueman-manager-wrapped)"
        "move 20 55, class:(.blueman-manager-wrapped)"
        "pin, class:(.blueman-manager-wrapped)"

        "suppressevent, class:(steam_app_2519830)"
        "float, class:(com.ayugram.desktop), title:(Просмотр медиа)"
        "float, class:(xdg-desktop-portal-gtk), title:(Открытие файлов)"
        "float, class:(xdg-desktop-portal-gtk), title:(Сохранить файл)"
        "float, class:(xdg-desktop-portal-gtk), title:(Все файлы)"
        "float, class:(electron), title:(Сохранить файл)"
        #"noinitialfocus, class:(jetbrains-)(.*), floating:1"
        "noinitialfocus, class:(Adobe Substance 3D Painter), floating:1"
        "noinitialfocus, class:(resolve), floating:1"
        "renderunfocused, title:(Resonite)"
      ];

      exec-once = [
        #"hyprpaper"
        #"hypridle"
        "uwsm app waybar"
        "uwsm-app blueman-applet"
        "uwsm-app nm-applet"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "/home/destony/Development/Apps/hyproled -s -a 0:0:3840:100"
      ];

      binds = {
        scroll_event_delay = 100;
      };

      bind = [
        # Exit hyprland
        "$mainMod, M, exec, uwsm stop"

        "bind = SUPER, V, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy"

        # Main binds
        "$mainMod, return, exec, rofi -show drun"
        "$mainMod, Q, exec, alacritty"
        "$mainMod SHIFT, Q, exec, nautilus"
        "$mainMod, E, killactive,"
        "$mainMod, T, togglefloating,"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, S, fullscreen, 1"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, P, pin,"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, O, exec, /home/destony/Development/Apps/hyproled -s -a 0:0:3840:100"
        "$mainMod SHIFT, O, exec, /home/destony/Development/Apps/hyproled -s -a 0:0:0:0"
        "$mainMod, tab, overview:toggle"

        # Audio control
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioPlay, exec, playerctl play-pause" #waybar-mpris --send toggle"
        ", XF86AudioNext, exec, playerctl next" #waybar-mpris --send next"
        ", XF86AudioPrev, exec, playerctl previous" #waybar-mpris --send prev"

        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
        ", XF86MonBrightnessUp, exec, brightnessctl s 5%+"

        # Screenshot & colorpick
        ", Print, exec, grimblast copy area"
        "ALT, Print, exec, grimblast copy output"
        "$mainMod SHIFT, C, exec, hyprpicker -an"

        # Move focus with mainMod + arrow keys
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Moving windows
        "$mainMod SHIFT, left,  swapwindow, l"
        "$mainMod SHIFT, right, swapwindow, r"
        "$mainMod SHIFT, up,    swapwindow, u"
        "$mainMod SHIFT, down,  swapwindow, d"

        # Window resizing                     X  Y
        "$mainMod CTRL, left,  resizeactive, -60 0"
        "$mainMod CTRL, right, resizeactive,  60 0"
        "$mainMod CTRL, up,    resizeactive,  0 -60"
        "$mainMod CTRL, down,  resizeactive,  0  60"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, split:workspace, 1"
        "$mainMod, 2, split:workspace, 2"
        "$mainMod, 3, split:workspace, 3"
        "$mainMod, 4, split:workspace, 4"
        "$mainMod, 5, split:workspace, 5"
        "$mainMod, 6, split:workspace, 6"
        "$mainMod, 7, split:workspace, 7"
        "$mainMod, 8, split:workspace, 8"
        "$mainMod, 9, split:workspace, 9"
        "$mainMod, 0, split:workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, split:movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, split:movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, split:movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, split:movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, split:movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, split:movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, split:movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, split:movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, split:movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, split:movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mainMod + arrows
        "$mainMod, right, split:workspace, e+1"
        "$mainMod, left, split:workspace, e-1"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, split:workspace, e+1"
        "$mainMod, mouse_up, split:workspace, e-1"

        # Waybar
        "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        #"$mainMod, W, exec, pkill -SIGUSR2 waybar"

        # Disable all effects
        "$mainMod Shift, G, exec, ~/.config/hypr/gamemode.sh "
        "$mainMod, mouse:276, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      # stop dislay on closed lid
      bindl = [
        '', switch:on:Lid Switch, exec, hyprctl keyword monitor "eDP-1,disable"''
        '', switch:off:Lid Switch, exec, hyprctl keyword monitor "eDP-1,preffered,auto,auto"''
      ];
    };
  };
}
