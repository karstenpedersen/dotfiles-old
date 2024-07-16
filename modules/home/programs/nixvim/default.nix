{ ... }:

{
  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
    ./bar.nix
  ];

  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    globals.maplocalleader = " ";
    colorschemes.catppuccin.enable = true;
  };
  # home.file.".config/nvim/ftplugin".source = ./ftplugin;
}

