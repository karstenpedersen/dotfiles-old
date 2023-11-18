{ config, pkgs, ... }:

{
  imports = [
    ./kitty
    ./lf
    ./nvim
    ./vscode
    ./rofi
    ./qutebrowser
  ];
}
