{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../programs/rofi
  ];

  home.packages = with pkgs; [
    maim
  ];

  home.file = {
    ".config/awesome/settings.lua".text = ''
      local settings = {}
      settings.terminal = os.getenv("TERMINAL") or "xterm"
      settings.browser = os.getenv("BROWSER") or "firefox"
      settings.editor = os.getenv("EDITOR") or "nano"
      settings.editor_cmd = settings.terminal .. " -e " .. settings.editor
      settings.launcher = "rofi -show drun"
      settings.modkey = "Mod4"
      return settings
    '';
    ".config/awesome/theme.lua".text = ''
      local beautiful = require("beautiful")
      beautiful.useless_gap = 3
      beautiful.gap_single_client = false
    '';
    ".config/awesome/wallpaper.png".source = ../common/wallpaper.png;
    ".config/awesome/rc.lua".source = ./rc.lua;
  };
}
