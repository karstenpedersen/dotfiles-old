{ pkgs, config, ... }:

{
  programs.yazi = {
    enable = true;
    settings = {
      # theme = "";
    };
  };
  home.file = {
    ".config/yazi/theme.toml".source = ./theme.toml;
    ".config/yazi/Catppuccin-mocha.tmTheme".source = ./Catppuccin-mocha.tmTheme;
  };
}

