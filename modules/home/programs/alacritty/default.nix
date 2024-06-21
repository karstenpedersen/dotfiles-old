{ config, pkgs, inputs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      env.term = "xterm-256color";
      font.size = 8;
    };
  };
}
