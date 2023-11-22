{ config, pkgs, ... }:

{
  imports = [
    ./kitty
    ./lf
    ./nvim
    ./vscode
    ./rofi
    ./qutebrowser
    ./firefox
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
    pamixer
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
    rofi
    xcolor
    xclip
    xdragon
    pistol
    ripgrep
    fd
    biber
    xdotool
    pstree 
    dwarf-fortress
    maim
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6" # Used for obsidian
  ];
}
