{ pkgs, config, ... }:

{
  programs.zathura = {
    enable = true;
    options = {
      notification-error-bg = "#${config.colorScheme.colors.base08}";
      notification-error-fg = "#${config.colorScheme.colors.base05}";
      notification-warning-bg = "#${config.colorScheme.colors.base09}";
      notification-warning-fg = "#${config.colorScheme.colors.base05}";
      notification-bg = "#${config.colorScheme.colors.base00}";
      notification-fg = "#${config.colorScheme.colors.base05}";
      completion-bg = "#${config.colorScheme.colors.base00}";
      completion-fg = "#${config.colorScheme.colors.base05}";
      completion-group-bg = "#${config.colorScheme.colors.base00}";
      completion-group-fg = "#${config.colorScheme.colors.base05}";
      completion-highlight-bg = "#${config.colorScheme.colors.base06}";
      completion-highlight-fg = "#${config.colorScheme.colors.base00}";
      index-bg = "#${config.colorScheme.colors.base00}";
      index-fg = "#${config.colorScheme.colors.base05}";
      index-active-bg = "#${config.colorScheme.colors.base05}";
      index-active-fg = "#${config.colorScheme.colors.base00}";
      inputpar-bg = "#${config.colorScheme.colors.base00}";
      inputpar-fg = "#${config.colorScheme.colors.base05}";
      statusbar-bg = "#${config.colorScheme.colors.base01}";
      statusbar-fg = "#${config.colorScheme.colors.base05}";
      highlight-color = "#${config.colorScheme.colors.base06}";
      highlight-active-color = "#${config.colorScheme.colors.base07}";
      render-loading = true;
      render-loading-bg = "#${config.colorScheme.colors.base00}";
      render-loading-fg = "#${config.colorScheme.colors.base05}";
      recolor-lightcolor = "#${config.colorScheme.colors.base04}";
      recolor-darkcolor = "#${config.colorScheme.colors.base00}";
      default-bg = "#${config.colorScheme.colors.base00}";
      default-fg = "#${config.colorScheme.colors.base05}";
    };
  };
}
