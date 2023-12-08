{ pkgs, config, ... }:

{
  programs.waybar = {
    settings = {
      layer = "top";
      position = "top";
      height = 24;
      modules-left = [
        "workspaces"
        "wlr/taskbar"
      ];
      modules-center = [
        "hyprland/window"
      ];
      modules-right = [
        "tray"
        "hyprland/language"
        "battery"
        "clock"
      ];
    };
  };
}
