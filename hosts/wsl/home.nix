{ inputs, ... }:

{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
  ];

  # Home
  programs.home-manager.enable = true;
  home.username = "nixos";
  home.homeDirectory = "/home/nixos";
  home.stateVersion = "24.05";
  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "code";
    OPENER = "code";
    TERM = "xterm-256color";
    PAGER = "less";
    FLAKE = "/home/nixos/dotfiles";
  };

  home.packages = with pkgs; [
    nh
  };
}

