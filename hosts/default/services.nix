{ config, pkgs, ... }:

{
  imports = [
    ../../modules/home-manager/services/mako
    ../../modules/home-manager/services/espanso
  ];
}
