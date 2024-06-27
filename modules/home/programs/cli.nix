{ config, pkgs, inputs, ... }:

{
  imports = [
    ./bat
    ./yazi
    ./fzf
    ./btop
    ./git
    ./lazygit
    ./zoxide
    ./tmux
    ./starship
    ./direnv
    ./nixvim
    # ./nix-index
    ./cheat
  ];

  home.packages = with pkgs; [
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

    tealdeer

    # Processors
    jq
    yq
  ];
}
