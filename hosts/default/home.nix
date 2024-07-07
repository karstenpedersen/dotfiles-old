{ inputs, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home/desktops/awesome
    ./programs.nix
    ./services.nix
  ];

  # Home
  programs.home-manager.enable = true;
  home.username = "karsten";
  home.homeDirectory = "/home/karsten";
  home.stateVersion = "23.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "codium";
    OPENER = "codium";
    TERM = "xterm-256color";
    TERMINAL = "alacritty";
    PAGER = "less";
    BROWSER = "chromium";
  };

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
