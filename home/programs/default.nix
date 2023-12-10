{ config, pkgs, ... }:

{
  imports = [
    ./hypr
    ./lf
    ./git
    ./zsh
    ./kitty
    ./nvim
    ./btop
    ./vscode
    ./rofi
    ./qutebrowser
    ./firefox
    ./waybar
    ./zathura
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
