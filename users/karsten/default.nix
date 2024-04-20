{ config, lib,  }:

{
  home = {
    username = "karsten";
    homeDirectory = "/home/karsten";
  };
  packages = with pkgs; [
    file
    unzip
    btop
  ];
  home.stateVersion = "23.05";
}
