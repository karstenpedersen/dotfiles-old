{ config, pkgs, ... }:

{
  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    colors = {
      bg = "#${config.colorScheme.colors.base00}";
      "bg+" = "#${config.colorScheme.colors.base03}";
      fg = "#${config.colorScheme.colors.base05}";
      "fg+" = "#${config.colorScheme.colors.base05}";
    };
  };
}
