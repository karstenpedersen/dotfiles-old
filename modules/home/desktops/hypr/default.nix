{ config, pkgs, lib, ... }:

let
  startup = pkgs.pkgs.writeShellScriptBin "start" ''
    ${pkgs.mako}/bin/mako &
    ${pkgs.waybar}/bin/waybar &
    ${pkgs.swayidle}/bin/swayidle -w timeout 300 'swaylock -f' timeout 360 'hyprctl dispatch dpms off' resume 'hyprctl dispatch dpms on' &
    ${pkgs.swww}/bin/swww init &
    ${pkgs.swww}/bin/swww img ${config.wallpaper} &
    ${pkgs.wl-clipboard}/bin/wl-paste --type text --watch ${pkgs.cliphist}/bin/cliphist store &
    ${pkgs.wl-clipboard}/bin/wl-paste --type image --watch ${pkgs.cliphist}/bin/cliphist store &
  '';
in
{
  imports = [
    ./rofi
  ];

  home.packages = with pkgs; [
    swayidle
    hyprpicker
    grimblast
  ];

  options = {
    wallpaper = lib.mkOption {
      default = ../common/wallpaper.png;
      type = lib.types.path;
      description = ''
        Path to your wallpaper
      '';
    };
    terminal = lib.mkOption {
      default = "kitty";
      type = lib.types.string;
      description = ''
        Terminal
      '';
    };
  };
  config = {
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
          touchpad.natural_scroll = true;
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
          "workspace 8, title:WebCord"
          "noinitialfocus, title:WebCord"
          "workspace 9, title:Spotify"
          "noinitialfocus, title:Spotify"
          "pin, xdragon"
          "opacity 0.5, xdragon"
          "move 8 100%-100, xdragon"
        ];
        bind = [
          "$mod, return, exec, $terminal"
          "$mod SHIFT, q, killactive"
          "$mod, d, exec, $menu"
          "$mod SHIFT, f, exec, rofi -show filebrowser -show-icon"
          "$mod SHIFT, w, exec, rofi -show window -show-icon"
          "$mod SHIFT, p, exec, rofi-pass"
          "$mod SHIFT, c, exec, hyprpicker --format=hex -a"
          "$mod SHIFT, s, exec, grimblast copy area"
          "$mod SHIFT, v, exec, cliphist list | rofi -dmenu -p cliphist | cliphist decode | wl-copy"
          "$mod CTRL SHIFT, v, exec, cliphist wipe"
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

          # Windows
          "$mod, h, movefocus, l"
          "$mod, l, movefocus, r"
          "$mod, k, movefocus, u"
          "$mod, j, movefocus, d"
          "$mod SHIFT, h, movewindow, l"
          "$mod SHIFT, l, movewindow, r"
          "$mod SHIFT, k, movewindow, u"
          "$mod SHIFT, j, movewindow, d"
          "$mod CTRL SHIFT, h, resizeactive, -50 0"
          "$mod CTRL SHIFT, l, resizeactive, 50 0"
          "$mod CTRL SHIFT, k, resizeactive, 0 -50"
          "$mod CTRL SHIFT, j, resizeactive, 0 50"
          "$mod CTRL SHIFT, r, resizeactive, exact 50% 50%"

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
  };
}
