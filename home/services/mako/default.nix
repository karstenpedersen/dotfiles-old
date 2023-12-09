{ pkgs, config, ... }:

{
  services.mako = {
    enable = true;
    defaultTimeout = 30000;
    textColor = "#${config.colorScheme.colors.base05}";
    borderColor = "#${config.colorScheme.colors.base05}";
    backgroundColor = "#${config.colorScheme.colors.base01}";
    width = 450;
    height = 120;
    borderSize = 2;
    borderRadius = 0;
  };
}
