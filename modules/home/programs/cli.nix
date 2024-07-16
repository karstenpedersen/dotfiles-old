{ config, pkgs, inputs, ... }:

{
  imports = [
    ./bat
    ./yazi
    ./fzf
    ./btop
    ./git
    ./lazygit
    ./tmux
    ./starship
    ./direnv
    ./nixvim
    ./nix-index
    ./cheat
    ./nb
  ];

  home.packages = with pkgs; [
    cz-cli
    micro
    man-pages
    eza
    ripgrep
    ripgrep-all
    file
    fd
    pstree
    xxd
    git-ignore
    duf
    gawk
    unzip
    zip
    gnutar
    gnused
    sd
    gnupg
    trash-cli
    gh
    slides
    pre-commit

    tealdeer
    cheat

    # Containers
    podman
    podman-tui

    # Processors
    jq
    yq
  ];
}
