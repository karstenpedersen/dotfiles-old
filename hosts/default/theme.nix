{ pkgs, inputs, ... }:

{
  
  # Theme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.adwaita-icon-theme;
    name = "Adwaita";
    size = 16;
  };
}
