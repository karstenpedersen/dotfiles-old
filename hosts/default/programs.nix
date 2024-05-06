{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home/programs/hypr
    ../../modules/home/programs/lf
    ../../modules/home/programs/git
    ../../modules/home/programs/bash
    ../../modules/home/programs/starship
    ../../modules/home/programs/kitty
    ../../modules/home/programs/nixvim
    ../../modules/home/programs/btop
    ../../modules/home/programs/vscode
    ../../modules/home/programs/rofi
    ../../modules/home/programs/firefox
    ../../modules/home/programs/waybar
    ../../modules/home/programs/zathura
    ../../modules/home/programs/swaylock
    ../../modules/home/programs/zoxide
    ../../modules/home/programs/lazygit
    ../../modules/home/programs/bat
    ../../modules/home/programs/direnv
    ../../modules/home/programs/kakoune
    ../../modules/home/programs/fzf
  ];

  # Packages
  home.packages = with pkgs; [
    # libnotify
    man-pages
    pass
    gnupg
    xdragon
    pistol
    ripgrep
    eza
    fd
    file
    gnused
    jq
    gawk
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
    pandoc
    bpftrace
    trashy
    xxd

    # Android
    android-tools

    # Applications
    zotero
    anki-bin
    obsidian
    spotify
    fluffychat
    webcord
    zoom-us
    nextcloud-client
    pavucontrol
    obs-studio
    libsForQt5.kdenlive
    libsForQt5.dragon
    keepassxc

    # Games
    steam
    prismlauncher

    # Gamedev
    godot_4
    aseprite
  ];

  nixpkgs.config.allowUnfree = true;
}
