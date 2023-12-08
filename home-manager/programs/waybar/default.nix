{ pkgs, config, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 14;
        modules-left = [
          "hyprland/workspaces"
        ];
        modules-center = [
          "hyprland/window"
        ];
        modules-right = [
          "tray"
          "hyprland/language"
          "pulseaudio"
          "network"
          "battery"
          "clock"
        ];
        "hyprland/workspaces" = {
          disable-scroll = true;
          all-outputs = true;
        };
        "hyprland/window" = {
          format = "{title}";
          max-length = 50;
        };
      };
    };
    style = ''
      * {
        font-size: 14px;
        font-family: monospace;
      }

      window#waybar {
        background: #000000;
        color: #fafafa;
      }

      #workspaces,
      #tray,
      #language,
      #pulseaudio,
      #battery,
      #network,
      #clock {
        background: transparent;
      }

      #tray,
      #language,
      #pulseaudio,
      #network,
      #battery,
      #clock {
        padding-right: 10px;
      }

      #workspaces button {
        padding: 0 2px;
        color: #757575;
        border-radius: 0;
        border: 0;
        border-bottom: 2px solid transparent;
      }

      #workspaces button.active,
      #workspaces button:hover {
        color: #fafafa;
        background: #000000;
        border-color: #fafafa;
      }
    '';
  };
}
