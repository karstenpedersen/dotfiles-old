{ pkgs, config, ... }:

{
  programs.qutebrowser = {
    enable = true;
    settings = {
      colors = {
        hints = {
          bg = "#${config.colorScheme.colors.base00}";
          fg = "#${config.colorScheme.colors.base05}";
        };
        tabs.bar.bg = "#${config.colorScheme.colors.base00}";
        completion = {
          fg = "#${config.colorScheme.colors.base05}";
          category = {
            bg = "#${config.colorScheme.colors.base00}";
          };
          even.bg = "#${config.colorScheme.colors.base02}";
        };
      };
    };
  };
}
