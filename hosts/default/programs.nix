{ config, pkgs, outputs, ... }:

{
  imports = [
    ../../modules/home-manager/programs/hypr
    ../../modules/home-manager/programs/lf
    ../../modules/home-manager/programs/git
    # ../../modules/home-manager/programs/zsh
    ../../modules/home-manager/programs/bash
    ../../modules/home-manager/programs/kitty
    # ../../modules/home-manager/programs/nvim
    ../../modules/home-manager/programs/nixvim
    ../../modules/home-manager/programs/btop
    ../../modules/home-manager/programs/vscode
    ../../modules/home-manager/programs/rofi
    ../../modules/home-manager/programs/firefox
    ../../modules/home-manager/programs/waybar
    ../../modules/home-manager/programs/zathura
    ../../modules/home-manager/programs/swaylock
    ../../modules/home-manager/programs/zoxide
    ../../modules/home-manager/programs/lazygit
    ../../modules/home-manager/programs/bat
  ];

  nixpkgs = {
    overlays = [
      (final: prev: {
        obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
      })
    ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true; # bug: https://github.com/nix-community/home-manager/issues/2942
    };
  };

  # Packages
  home.packages = with pkgs; [
    libnotify
    devbox
    # autojump
    man-pages
    pass
    gnupg
    tectonic
    xdragon
    pistol
    ripgrep
    fzf
    eza
    fd
    biber
    pstree
    hyprpicker
    wl-clipboard
    pipewire
    wireplumber
    polkit-kde-agent
    pamixer
    light
    playerctl
    grimblast
    wtype
    swayidle
    unzip
    zip
    gnutar
    pdftk
    python3
    # catppuccin-cursors
    lazydocker

    android-tools
    wayvnc

    pandoc

    # Applications
    zotero
    obsidian-wayland
    rnote
    discord
    spotify
    nextcloud-client
    pavucontrol
    xournalpp
    godot_4
    aseprite
    # sageWithDoc
    geogebra
    # geogebra6

    # Bloat
    neofetch
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6" # Used for obsidian
  ];

  # Mime types
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/*" = [ "nvim.desktop" ];
      "application/pdf" = [ "zathura.desktop" ];
    };
  };
}
