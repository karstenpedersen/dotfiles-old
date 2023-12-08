{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    ./hyprland
    ./programs
  ];

  # Home
  programs.home-manager.enable = true;
  home.username = "karsten";
  home.homeDirectory = "/home/karsten";
  home.stateVersion = "23.11";
 
  # Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
