{ config, pkgs, ... }:

{
  imports = [
    ./lf
    ./git
    ./zsh
    ./kitty
    ./nvim
    ./vscode
    ./rofi
    ./qutebrowser
    ./firefox
    ./waybar
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
    # xdotool
    pstree 
    xclip
    hyprpicker
    wl-clipboard
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6" # Used for obsidian
  ];

  # Mime types
  xdg.mimeApps.defaultApplications = {
    "text/*" = ["nvim.desktop"];
    "application/pdf" = ["zathura.desktop"];
  };
}
