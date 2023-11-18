{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      tab_title_template = "{index}: {title}";

      font_family = "FiraMono";
      bold_font = "FiraMono Bold";

      background = "#${config.colorScheme.colors.base00}";
      foreground = "#${config.colorScheme.colors.base05}";
      selection_background = "#${config.colorScheme.colors.base05}";
      selection_foreground = "#${config.colorScheme.colors.base00}";
      url_color = "#${config.colorScheme.colors.base0D}";
      cursor = "#${config.colorScheme.colors.base0D}";
      cursor_text_color = "#${config.colorScheme.colors.base00}";
      active_border_color = "#${config.colorScheme.colors.base03}";
      inactive_border_color = "#${config.colorScheme.colors.base01}";
      active_tab_background = "#${config.colorScheme.colors.base00}";
      active_tab_foreground = "#${config.colorScheme.colors.base05}";
      inactive_tab_background = "#${config.colorScheme.colors.base01}";
      inactive_tab_foreground = "#${config.colorScheme.colors.base04}";
    };
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
    };
    extraConfig = ''
      # Copy-mode with Nvim
      scrollback_pager ~/dotfiles/home-manager/programs/kitty/pager.sh 'INPUT_LINE_NUMBER' 'CURSOR_LINE' 'CURSOR_COLUMN'
      map f1 launch --type overlay --stdin-source=@screen_scrollback ~/dotfiles/home-manager/programs/kitty/pager.sh

      # Kitty Nvim navigator
      allow_remote_control yes
      listen_on unix:@mykitty
      map ctrl+j kitten ~/dotfiles/home-manager/programs/kitty/pass_keys.py neighboring_window bottom ctrl+j
      map ctrl+k kitten ~/dotfiles/home-manager/programs/kitty/pass_keys.py neighboring_window top ctrl+k
      map ctrl+h kitten ~/dotfiles/home-manager/programs/kitty/pass_keys.py neighboring_window left ctrl+h
      map ctrl+l kitten ~/dotfiles/home-manager/programs/kitty/pass_keys.py neighboring_window right ctrl+l
    '';
  };
}
