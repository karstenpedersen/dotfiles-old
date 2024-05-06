{ pkgs, config, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      # tab_title_template = "{index}: {title}";

      font_family = "FiraMono";
      bold_font = "FiraMono Bold";

      # The basic colors
      foreground = "#${config.colorScheme.colors.base05}";
      background = "#${config.colorScheme.colors.base00}";
      selection_foreground = "#${config.colorScheme.colors.base00}";
      selection_background = "#${config.colorScheme.colors.base06}";
      # Cursor colors
      cursor = "#${config.colorScheme.colors.base06}";
      cursor_text_color = "#${config.colorScheme.colors.base00}";
      # URL underline color when hovering with mouse
      url_color = "#${config.colorScheme.colors.base06}";
      # Kitty window border colors
      active_border_color = "#${config.colorScheme.colors.base07}";
      inactive_border_color = "#${config.colorScheme.colors.base04}";
      bell_border_color = "#${config.colorScheme.colors.base0A}";
      # Tab bar colors
      active_tab_background = "#${config.colorScheme.colors.base00}";
      active_tab_foreground = "#${config.colorScheme.colors.base05}";
      inactive_tab_background = "#${config.colorScheme.colors.base01}";
      inactive_tab_foreground = "#${config.colorScheme.colors.base04}";
      tab_bar_background = "#${config.colorScheme.colors.base01}";
      # Colors for marks (marked text in the terminal)
      mark1_foreground = "#${config.colorScheme.colors.base00}";
      mark1_background = "#${config.colorScheme.colors.base07}";
      mark2_foreground = "#${config.colorScheme.colors.base00}";
      mark2_background = "#${config.colorScheme.colors.base0E}";
      mark3_foreground = "#${config.colorScheme.colors.base00}";
      mark3_background = "#${config.colorScheme.colors.base0D}";

      # The 16 terminal colors
      # black
      color0 = "#${config.colorScheme.colors.base03}";
      color8 = "#${config.colorScheme.colors.base04}";
      # red
      color1 = "#${config.colorScheme.colors.base08}";
      color9 = "#${config.colorScheme.colors.base08}";
      # green
      color2  = "#${config.colorScheme.colors.base0B}";
      color10 = "#${config.colorScheme.colors.base0B}";
      # yellow
      color3 = "#${config.colorScheme.colors.base0A}";
      color11 = "#${config.colorScheme.colors.base0A}";
      # blue
      color4 = "#${config.colorScheme.colors.base0D}";
      color12 = "#${config.colorScheme.colors.base0D}";
      # magenta
      color5 = "#${config.colorScheme.colors.base0E}";
      color13 = "#${config.colorScheme.colors.base0E}";
      # cyan
      color6 = "#${config.colorScheme.colors.base0C}";
      color14 = "#${config.colorScheme.colors.base0C}";
      # white
      color7 = "#${config.colorScheme.colors.base05}";
      color15 = "#${config.colorScheme.colors.base05}";
    };
    shellIntegration.enableBashIntegration = true;
    keybindings = {
      "ctrl+shift+enter" = "new_window_with_cwd";
      "ctrl+shift+t" = "new_tab_with_cwd";
      "ctrl+shift+o" = "pass_selection_to_program firefox";
      "ctrl+f2" = "detach_window";
      "ctrl+f3" = "detach_window new-tab";
      "ctrl+f9" = "close_other_windows_in_tab";
      "f1" = "show_last_visited_command_output";
    };
    extraConfig = ''
      # Copy-mode with Nvim
      scrollback_pager ~/.config/kitty/pager.sh 'INPUT_LINE_NUMBER' 'CURSOR_LINE' 'CURSOR_COLUMN'

      # Kitty Nvim navigator
      allow_remote_control yes
      listen_on unix:@mykitty
      # single_instance yes
      # map ctrl+j kitten ~/.config/kitty/pass_keys.py neighboring_window bottom ctrl+j
      # map ctrl+k kitten ~/.config/kitty/pass_keys.py neighboring_window top ctrl+k
      # map ctrl+h kitten ~/.config/kitty/pass_keys.py neighboring_window left ctrl+h
      # map ctrl+l kitten ~/.config/kitty/pass_keys.py neighboring_window right ctrl+l
    '';
  };
  home.file = {
    # ".config/kitty/pass_keys.py".source = ./pass_keys.py;
    # ".config/kitty/neighboring_window.py".source = ./neighboring_window.py;
    ".config/kitty/pager.sh".source = ./pager.sh;
  };
}
