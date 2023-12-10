{ config, pkgs, ... }:

#let
  #modules = ../../modules/home-manager;
  # programs = import (modules + "/programs");
#in 
{
  imports = [
    ../../modules/home-manager/programs/hypr
    ../../modules/home-manager/programs/lf
    ../../modules/home-manager/programs/git
    ../../modules/home-manager/programs/zsh
    ../../modules/home-manager/programs/kitty
    ../../modules/home-manager/programs/nvim
    ../../modules/home-manager/programs/btop
    ../../modules/home-manager/programs/vscode
    ../../modules/home-manager/programs/rofi
    ../../modules/home-manager/programs/qutebrowser
    ../../modules/home-manager/programs/firefox
    ../../modules/home-manager/programs/waybar
    ../../modules/home-manager/programs/zathura
  ];
  
  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true; # bug: https://github.com/nix-community/home-manager/issues/2942
    };
  };

  # Packages
  home.packages = with pkgs; [
    libnotify
    btop
    git
    devbox
    autojump
    lf
    man-pages
    pass
    gnupg
    kitty
    zathura
    tectonic
    zotero
    obsidian
    firefox
    discord
    spotify
    nextcloud-client
    vscodium
    rofi-wayland
    xdragon
    pistol
    ripgrep
    fd
    biber
    pstree 
    hyprpicker
    wl-clipboard
    pipewire
    wireplumber
    pavucontrol
    polkit-kde-agent
    pamixer
    light
    playerctl
    grimblast
    wtype
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6" # Used for obsidian
  ];

  # Mime types
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/*" = ["nvim.desktop"];
      "text/markdown" = ["nvim.desktop"];
      "application/pdf" = ["zathura.desktop"];
    };
  };
}
