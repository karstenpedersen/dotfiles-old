{ config, pkgs, ... }:

{
  imports = [];

  home.packages = with pkgs; [
    eww
    swww
    mako
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    extraConfig = ''
      # See https://wiki.hyprland.org/Configuring/Monitors/
      monitor=,1920x1080@144,auto,1

      # Fix slow startup
      exec systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec dbus-update-activation-environment --systemd DISPLAY WAYLAND_DISPLAY XDG_CURRENT_DESKTOP

      # Autostart
      exec-once = mako
      exec-once = waybar
      exec-once = espanso start

      source = ./colors
      # exec-once = swww init & swww img ./assets/wallpaper.png

      # Programs
      $terminal = kitty
      $fileManager = dolphin
      $menu = rofi -show drun -show-icon 

      # Env
      env = XCURSOR_SIZE,20

      # For all categories, see https://wiki.hyprland.org/Configuring/Variables/
      input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 1

        touchpad {
            natural_scroll = no
        }

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
      }

      general {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        gaps_in = 3
        gaps_out = 3
        border_size = 2
        col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        col.inactive_border = rgba(595959aa)

        layout = dwindle

        # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
        allow_tearing = false
      }

      decoration {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more

        rounding = 5
        
        blur {
          enabled = true
          size = 3
          passes = 1
        }

        drop_shadow = no
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
      }

      animations {
        enabled = yes

        # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

        bezier = myBezier, 0.05, 0.9, 0.1, 1.0

        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }

      dwindle {
        # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
        pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = yes # you probably want this
      }

      master {
        # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
        new_is_master = true
      }

      gestures {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        workspace_swipe = off
      }

      misc {
        # See https://wiki.hyprland.org/Configuring/Variables/ for more
        force_default_wallpaper = 0 # Set to 0 to disable the anime mascot wallpapers
        disable_hyprland_logo = true
        disable_splash_rendering = true
      }

      # Example per-device config
      # See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
      device:epic-mouse-v1 {
        sensitivity = -0.5
      }

      # Example windowrule v1
      # windowrule = float, ^(kitty)$
      # Example windowrule v2
      # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
      # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
      windowrulev2 = nomaximizerequest, class:.* # You'll probably like this.

      # Keybinds
      $mod = SUPER

      bind = $mod, return, exec, $terminal
      bind = $mod SHIFT, q, killactive
      bind = $mod SHIFT, e, exit
      bind = $mod, d, exec, $menu
      bind = $mod SHIFT, c, exec, hyprpicker --format=[hex] -a
      bind = $mod, v, togglefloating
      bind = $mod, u, focusurgentorlast
      bind = $mod, tab, focuscurrentorlast
      bind = $mod, f, fullscreen

      bind = ,XF86AudioMicMute, exec, pamixer --default-source -t
      bind = ,XF86MonBrightnessDown,exec, light -U 20
      bind = ,XF86MonBrightnessUp, exec, light -A 20
      bind = ,XF86AudioMute, exec, pamixer -t
      bind = ,XF86AudioLowerVolume, exec, pamixer -d 5
      bind = ,XF86AudioRaiseVolume, exec, pamixer -i 5
      bind = ,XF86AudioPlay, exec, playerctl play-pause
      bind = ,XF86AudioPause, exec, playerctl play-pause
      bind = ,XF86AudioNext, exec, playerctl next
      bind = ,XF86AudioPrev, exec, playerctl previous

      # Move focus with h,j,k,l
      bind = $mod, h, movefocus, l
      bind = $mod, l, movefocus, r
      bind = $mod, k, movefocus, u
      bind = $mod, j, movefocus, d
      
      # Workspaces
      ${builtins.concatStringsSep "\n" (builtins.genList (
        x: let
          ws = let
            c = (x + 1) / 10;
          in
            builtins.toString (x + 1 - (c * 10));
        in ''
          bind = $mod, ${ws}, workspace, ${toString (x + 1)}
          bind = $mod SHIFT, ${ws}, movetoworkspacesilent, ${toString (x + 1)}
          bind = $mod CTRL, ${ws}, movetoworkspace, ${toString (x + 1)}
        ''
      )
      10)}
      
      # Scratchpad
      bind = $mod, S, togglespecialworkspace, magic
      bind = $mod SHIFT, S, movetoworkspace, special:magic

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = $mod, mouse:272, movewindow
      bindm = $mod, mouse:273, resizewindow
    '';
  };

  home.file.".config/hypr/colors".text = ''
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

  home.sessionVariables = {
    GBM_BACKEND= "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME= "nvidia";
    LIBVA_DRIVER_NAME= "nvidia"; # hardware acceleration
    __GL_VRR_ALLOWED="1";
    WLR_NO_HARDWARE_CURSORS = "1";
    WLR_RENDERER_ALLOW_SOFTWARE = "1";
    CLUTTER_BACKEND = "wayland";
    WLR_RENDERER = "vulkan";
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
  };
}