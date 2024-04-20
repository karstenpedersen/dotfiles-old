{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home/services/mako
    ../../modules/home/services/espanso
  ];
}
