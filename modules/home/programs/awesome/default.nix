{ config, pkgs, inputs, ... }:

{
  home.file.".config/awesome/rc.lua".source = ./rc.lua;
}
