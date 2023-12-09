{ pkgs, config, ... }:

{
  option.services.mako = {
    textColor = "#fafafa";
    borderColor = "#fafafa";
    backgroundColor = "#000000";
    borderRadius = 0;
    defaultTimeout = 10000;
  };
}
