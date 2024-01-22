{ pkgs, config, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        editPreset = "nvim";
      };
    };
  };
}
