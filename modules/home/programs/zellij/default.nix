{ pkgs, config, ... }:

{
  programs.zellij = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      simplified_ui = true;
    };
  };
}
