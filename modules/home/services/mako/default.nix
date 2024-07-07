{ config, ... }:

{
  services.mako = {
    enable = true;
    defaultTimeout = 30000;
    textColor = "#${config.colorScheme.palette.base05}";
    borderColor = "#${config.colorScheme.palette.base05}";
    backgroundColor = "#${config.colorScheme.palette.base01}";
    width = 450;
    height = 120;
    borderSize = 2;
    borderRadius = 0;
  };
}
