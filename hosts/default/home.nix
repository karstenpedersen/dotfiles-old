{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.hyprland.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./programs.nix
    ./services.nix
  ];

  # Home
  programs.home-manager.enable = true;
  home.username = "karsten";
  home.homeDirectory = "/home/karsten";
  home.stateVersion = "23.05";

  # Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    size = 16;
  };
}
