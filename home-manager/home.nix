{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./programs
  ];

  # Home
  programs.home-manager.enable = true;
  home.username = "karsten";
  home.homeDirectory = "/home/karsten";
  home.stateVersion = "23.05";
 
  # Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  # gtk = {
  #   enable = true;
  #   theme.package = pkgs.adw-gtk3;
  #   theme.name = "adw-gtk3";
  #   cursorTheme.package = pkgs.bibata-cursors;
  #   cursorTheme.name = "Bibata-Modern-Ice";
  #   # iconTheme.package = gruvboxPlus;
  #   # iconTheme.name = "GruvboxPlus";
  # };
  # qt = {
  #   enable = true;
  #   platformTheme = "gtk";
  #   style.package = pkgs.adwaita-qt;
  #   style.name = "adwaita-dark";
  # };

  # Environment
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Git
  programs.git = {
    enable = true;
    userName  = "Karsten Pedersen";
    userEmail = "karstenfp.all@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
    aliases = {
      pu = "push";
      cm = "commit";
      co = "checkout";
      sw = "switch";
      s = "status";
    };
  };

  # Mime types
  xdg.mimeApps.defaultApplications = {
    "text/*" = ["nvim.desktop"];
    "application/pdf" = ["zathura.desktop"];
  };

  # Shell
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
  };
}
