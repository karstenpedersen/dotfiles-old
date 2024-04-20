{ config, pkgs, inputs, ... }:

{
  imports = [
    ../../modules/home/programs/hypr
    # ../../modules/home/programs/lf
    # inputs.self.nixosModules.home-programs-lf
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
  ];

  nixpkgs = {
    # overlays = [
    #   (final: prev: {
    #     obsidian-wayland = prev.obsidian.override {electron = final.electron_24;};
    #   })
    # ];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true; # bug: https://github.com/nix-community/home-manager/issues/2942
    };
  };

  # Packages
  home.packages = with pkgs; [
    libnotify
    man-pages
    pass
    gnupg
    xdragon
    pistol
    ripgrep
    fzf
    eza
    fd
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
    # python3
    # lazydocker
    pandoc
    bpftrace

    # Android
    android-tools

    # VM
    qemu
    virt-manager

    # Applications
    zotero
    obsidian
    rnote
    discord
    cinny-desktop
    fluffychat
    webcord
    spotify
    nextcloud-client
    pavucontrol
    xournalpp
    godot_4
    aseprite
    geogebra
    # chromium
    anki-bin
    obs-studio
    libsForQt5.kdenlive
    libsForQt5.dragon
    zoom-us

    # Games
    rogue
    prismlauncher
  ];
  # nixpkgs.config.permittedInsecurePackages = [
  #   "electron-24.8.6" # Used for obsidian
  # ];

  # Mime types
  # xdg.mimeApps = {
  #   enable = true;
  #   defaultApplications = {
  #     "text/*" = [ "nvim.desktop" ];
  #     "application/pdf" = [ "zathura.desktop" ];
  #   };
  # };
}
