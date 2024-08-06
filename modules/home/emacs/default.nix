{ config, pkgs, ... }:

{
  programs.emacs = {
    enable = true;
    package = pkgs.emacs;
  };
  services.emacs.enable = true;
  home.file.".config/emacs/" = {
    source = ./config;
    recursive = true;
  };
  home.file.".config/emacs/nix-config.el".text = ''
      (provide 'nix-config)
  '';
  home.packages = (with pkgs.emacsPackages; [
    evil
    evil-surround
    evil-textobj-tree-sitter
    which-key
    general
    catppuccin-theme
    helm
    vertico
    consult
    orderless
    yasnippet
    magit
    # auctex
    texpresso
    undo-tree
    direnv
    pdf-tools
    presentation
    gcmh
  ]) ++ (with pkgs; [
    texpresso
  ]);
}
