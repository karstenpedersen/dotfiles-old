{ config, pkgs, ... }:

let
  startup = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.mako}/bin/mako &
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swayidle}/bin/swayidle -w timeout 300 'swaylock -f' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' &
    ${pkgs.swww}/bin/swww init &
    ${pkgs.swww}/bin/swww img ${./assets/wallpaper.png} &
  '';
in
{
  imports = [ ];

  home.packages = with pkgs; [
    eww
    swww
    mako
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    settings = {
      "$terminal" = "kitty";
      "$fileManager" = "lf";
      "$menu" = "rofi -show drun";
      "$mod" = "SUPER";
      exec-once = ''${startup}/bin/start'';
      monitor = [
        ", preferred, auto, 1"
      ];
      general = with config.colorScheme.colors; {
        gaps_in = 5;
        gaps_out = 8;
        border_size = 2;
        "col.active_border" = "rgba(${config.colorScheme.colors.base06}aa) rgba(${config.colorScheme.colors.base07}ee) 45deg";
        "col.inactive_border" = "rgba(${config.colorScheme.colors.base04}aa)";
        layout = "dwindle";
        allow_tearing = false;
      };
      input = {
        kb_layout = "us,dk";
        kb_options = "grp:alt_shift_toggle,caps:escape";
        follow_mouse = true;
        touchpad = {
          natural_scroll = true;
        };
        sensitivity = 0;
      };
      decoration = {
        rounding = 3;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.0";
        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
        no_gaps_when_only = 1;
      };
      master = {
        new_is_master = true;
      };
      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
      };
      windowrule = [
        "workspace 8, discord"
        "workspace 8, discord"
        "noinitialfocus, discord"
        "workspace 9, title:Spotify"
        "noinitialfocus, title:Spotify"
        "pin, xdragon"
        "opacity 0.5, xdragon"
        "move 8 100%-100, xdragon"
      ];
      windowrulev2 = [
        "nomaximizerequest, class:.*"
      ];
      bind = [
        "$mod, return, exec, $terminal"
        "$mod SHIFT, q, killactive"
        "$mod SHIFT, e, exit"
        "$mod, d, exec, $menu"
        "$mod SHIFT, f, exec, rofi -show filebrowser -show-icon"
        "$mod SHIFT, w, exec, rofi -show window -show-icon"
        "$mod SHIFT, p, exec, rofi-pass"
        "$mod SHIFT, c, exec, hyprpicker --format=[hex] -a"
        "$mod SHIFT, s, exec, grimblast copy area"
        ", Print, exec, grimblast copysave output ~/Pictures/Screenshots/\"\`date +\"%Y-%m-%d-%H%M%S\"\`\".png"
        "$mod, v, togglefloating"
        "$mod, u, focusurgentorlast"
        "$mod, tab, focuscurrentorlast"
        "$mod, f, fullscreen"
        ", XF86AudioMicMute, exec, pamixer --default-source -t"
        ", XF86MonBrightnessDown,exec, light -U 20"
        ", XF86MonBrightnessUp, exec, light -A 20"
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"

        # Focus with h,j,k,l"
        "$mod, h, movefocus, l"
        "$mod, l, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"

        # Scratchpad
        "$mod, 0, togglespecialworkspace, magic"
        "$mod SHIFT, 0, movetoworkspace, special:magic"
      ] ++
      # Workspaces
      (builtins.concatLists (builtins.genList
        (
          x:
          let
            ws = builtins.toString (x + 1);
          in
          [
            "$mod, ${ws}, workspace, ${ws}"
            "$mod SHIFT, ${ws}, movetoworkspacesilent, ${ws}"
            "$mod CTRL, ${ws}, movetoworkspace, ${ws}"
          ]
        )
        9));
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
    };
    # extraConfig = ''
    #   # Monitors
    #   monitor=,preferred,auto,1
    #   monitor = eDP-1, 1920x1080@144, auto, 1
    #
    #   # Fix slow startup
    #   exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    #   exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
    #
    #   # Autostart
    #   exec-once = mako
    #   exec-once = waybar
    #   exec-once = swayidle -w timeout 300 'swaylock -f' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on'
    #
    #   # source = ./colors
    #   exec-once = swww init
    #   exec-once = swww img ./wallpaper.png
    #
    #   # Programs
    #   $terminal = kitty
    #   $fileManager = lf
    #   $menu = rofi -show drun -show-icon 
    #
    #   # Env
    #   env = XCURSOR_SIZE,20
    #
    #   # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
    #   input {
    #     kb_layout = us,dk
    #     kb_variant =
    #     kb_model =
    #     kb_options = grp:alt_shift_toggle,caps:escape
    #     kb_rules =
    #     follow_mouse = 1
    #     touchpad {
    #         natural_scroll = yes
    #     }
    #     sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    #   }
    #
    #   general {
    #     # See https://wiki.hyprland.org/Configuring/Variables/ for more
    #
    #     gaps_in = 5
    #     gaps_out = 8
    #     border_size = 2
    #     col.active_border = rgba(${config.colorScheme.colors.base06}aa) rgba(${config.colorScheme.colors.base07}ee) 45deg 
    #     col.inactive_border = rgba(${config.colorScheme.colors.base04}aa)
    #
    #     layout = dwindle
    #
    #     # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    #     allow_tearing = false
    #   }
    #
    #   decoration {
    #     # See https://wiki.hyprland.org/Configuring/Variables/ for more
    #
    #     rounding = 3
    #     
    #     blur {
    #       enabled = true
    #       size = 3
    #       passes = 1
    #     }
    #
    #     drop_shadow = no
    #     shadow_range = 4
    #     shadow_render_power = 3
    #     col.shadow = rgba(${config.colorScheme.colors.base01}ee)
    #   }
    #
    #   animations {
    #     enabled = yes
    #     bezier = myBezier, 0.05, 0.9, 0.1, 1.0
    #     animation = windows, 1, 7, myBezier
    #     animation = windowsOut, 1, 7, default, popin 80%
    #     animation = border, 1, 10, default
    #     animation = borderangle, 1, 8, default
    #     animation = fade, 1, 7, default
    #     animation = workspaces, 1, 6, default
    #   }
    #
    #   dwindle {
    #     # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    #     pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    #     preserve_split = yes # you probably want this
    #     no_gaps_when_only = 1
    #   }
    #
    #   master {
    #     # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    #     new_is_master = true
    #   }
    #
    #   gestures {
    #     # See https://wiki.hyprland.org/Configuring/Variables/ for more
    #     workspace_swipe = off
    #   }
    #
    #   misc {
    #     force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
    #     disable_hyprland_logo = true
    #     disable_splash_rendering = true
    #   }
    #
    #   # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
    #   windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.
    #   windowrule = workspace 8, discord
    #   windowrule = noinitialfocus, discord
    #   windowrule = workspace 9, title:Spotify
    #   windowrule = noinitialfocus, title:Spotify
    #   windowrule = pin, xdragon
    #   windowrule = opacity 0.5, xdragon
    #   windowrule = move 8 100%-100, xdragon
    #
    #   # Keybinds
    #   $mod = SUPER
    #
    #   bind = $mod, return, exec, $terminal
    #   bind = $mod SHIFT, q, killactive
    #   bind = $mod SHIFT, e, exit
    #   bind = $mod, d, exec, $menu
    #   bind = $mod SHIFT, f, exec, rofi -show filebrowser -show-icon
    #   bind = $mod SHIFT, w, exec, rofi -show window -show-icon
    #   bind = $mod SHIFT, p, exec, rofi-pass
    #   bind = $mod SHIFT, c, exec, hyprpicker --format=[hex] -a
    #   bind = $mod SHIFT, s, exec, grimblast copy area
    #   bind = , Print, exec, grimblast copysave output ~/Pictures/Screenshots/"`date +"%Y-%m-%d-%H%M%S"`".png
    #   bind = $mod, v, togglefloating
    #   bind = $mod, u, focusurgentorlast
    #   bind = $mod, tab, focuscurrentorlast
    #   bind = $mod, f, fullscreen
    #
    #   bind = ,XF86AudioMicMute, exec, pamixer --default-source -t
    #   bind = ,XF86MonBrightnessDown,exec, light -U 20
    #   bind = ,XF86MonBrightnessUp, exec, light -A 20
    #   bind = ,XF86AudioMute, exec, pamixer -t
    #   bind = ,XF86AudioLowerVolume, exec, pamixer -d 5
    #   bind = ,XF86AudioRaiseVolume, exec, pamixer -i 5
    #   bind = ,XF86AudioPlay, exec, playerctl play-pause
    #   bind = ,XF86AudioPause, exec, playerctl play-pause
    #   bind = ,XF86AudioNext, exec, playerctl next
    #   bind = ,XF86AudioPrev, exec, playerctl previous
    #
    #   # Move focus with h,j,k,l
    #   bind = $mod, h, movefocus, l
    #   bind = $mod, l, movefocus, r
    #   bind = $mod, k, movefocus, u
    #   bind = $mod, j, movefocus, d
    #   
    #   # Workspaces
    #   ${builtins.concatStringsSep "\n" (builtins.genList (
    #     x: let
    #       ws = builtins.toString (x + 1);
    #     in ''
    #       bind = $mod, ${ws}, workspace, ${ws}
    #       bind = $mod SHIFT, ${ws}, movetoworkspacesilent, ${ws}
    #       bind = $mod CTRL, ${ws}, movetoworkspace, ${ws}
    #     ''
    #   )
    #   9)}
    #   
    #   # Scratchpad
    #   bind = $mod, 0, togglespecialworkspace, magic
    #   bind = $mod SHIFT, 0, movetoworkspace, special:magic
    #
    #   # Move/resize windows with mainMod + LMB/RMB and dragging
    #   bindm = $mod, mouse:272, movewindow
    #   bindm = $mod, mouse:273, resizewindow
    # '';
  };

  home.file = {
    ".config/hypr/wallpaper.png" = {
      source = ./assets/wallpaper.png;
    };
    ".config/hypr/colors" = {
      text = ''
        $background = rgba(1d192bee)
        $foreground = rgba(c3dde7ee)
        $color0 = rgba(1d192bee)
        $color1 = rgba(465EA7ee)
        $color2 = rgba(5A89B6ee)
        $color3 = rgba(6296CAee)
        $color4 = rgba(73B3D4ee)
        $color5 = rgba(7BC7DDee)
        $color6 = rgba(9CB4E3ee)
        $color7 = rgba(c3dde7ee)
        $color8 = rgba(889aa1ee)
        $color9 = rgba(465EA7ee)
        $color10 = rgba(5A89B6ee)
        $color11 = rgba(6296CAee)
        $color12 = rgba(73B3D4ee)
        $color13 = rgba(7BC7DDee)
        $color14 = rgba(9CB4E3ee)
        $color15 = rgba(c3dde7ee)
      '';
    };
  };

  home.sessionVariables = {
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia"; # hardware acceleration
    __GL_VRR_ALLOWED = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };
}
