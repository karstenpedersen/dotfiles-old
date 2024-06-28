{ pkgs, config, ... }:

{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      sensible
      yank
      catppuccin
    ];
    extraConfig = ''
      # Start windows and panes at index 1
      set -g base-index 1
      set -g pane-base-index 1
      set-window-option -g pane-base-index 1
      set-option -g renumber-windows on

      # Rebind prefix
      unbind C-b
      set -g prefix C-space
      bind C-space send-prefix

      # Synchronize panes
      bind-key g set-window-option synchronize-panes\; display-message "synchronize-panes is now #{?pane_synchronized,on,off}"

      # More binds
      bind -n M-H previous-window
      bind -n M-L next-window
      bind '"' split-window -v -c '#{pane_current_path}'
      bind % split-window -h -c '#{pane_current_path}'

      # Colors
      set -ga terminal-overrides ",$TERM:Tc"
    '';
  };
}

