{ pkgs, config, ... }:

{
  programs.lazygit = {
    enable = true;
    settings = {
      os = {
        editPreset = "nvim";
        open = "xdg-open {{filename}} >/dev/null";
      };
    };
  };
}
