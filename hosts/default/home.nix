{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    ./programs.nix
    # ./services
  ];

  # Home
  programs.home-manager.enable = true;
  home.username = "karsten";
  home.homeDirectory = "/home/karsten";
  home.stateVersion = "23.05";
 
  # Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
}
