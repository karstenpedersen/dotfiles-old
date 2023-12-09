{ pkgs, config, ... }:

{
  services.mako = {
    enable = true;
    textColor = "#fafafa";
    borderColor = "#fafafa";
    backgroundColor = "#000000";
    borderRadius = 0;
    defaultTimeout = 30000;
  };
}
