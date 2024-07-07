{ pkgs, ... }:

{
  imports = [
    ../../modules/home/programs/alacritty
    ../../modules/home/programs/kitty
    ../../modules/home/programs/vscode
    ../../modules/home/programs/zathura
    ../../modules/home/programs/bash
    ../../modules/home/programs/cli.nix
    ../../modules/home/programs/virtualization.nix
  ];

  # Packages
  home.packages = with pkgs; [
    pass
    sops
    age
    xdragon
    pistol
    pipewire
    wireplumber
    polkit-kde-agent
    pamixer
    light
    playerctl

    # Octave
    octaveFull

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
    planner
    dia

    logiops

    # Games
    steam
    prismlauncher

    # Gamedev
    godot_4
    # aseprite
  ];

  nixpkgs.config.allowUnfree = true;
}
