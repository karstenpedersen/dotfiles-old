{ config, pkgs, ... }:

{
  imports = [
    ./kitty/kitty.nix
    ./lf/lf.nix
    ./nvim/nvim.nix
    ./vscode/vscode.nix
    ./rofi/rofi.nix
    ./qutebrowser/qutebrowser.nix
  ];
}
