{ pkgs, config, ... }:

{
  programs.btop = {
    enable = true;
    settings = {
      color_theme = "base16";
    };
  };

  home.file = {
    ".config/btop/themes/base16.theme".text = ''
      # Main background, empty for terminal default, need to be empty if you want transparent background
      theme[main_bg]="#${config.colorScheme.colors.base00}"

      # Main text color
      theme[main_fg]="#${config.colorScheme.colors.base05}"

      # Title color for boxes
      theme[title]="#${config.colorScheme.colors.base05}"

      # Highlight color for keyboard shortcuts
      theme[hi_fg]="#${config.colorScheme.colors.base0D}"

      # Background color of selected item in processes box
      theme[selected_bg]="#${config.colorScheme.colors.base03}"

      # Foreground color of selected item in processes box
      theme[selected_fg]="#${config.colorScheme.colors.base0D}"

      # Color of inactive/disabled text
      theme[inactive_fg]="#${config.colorScheme.colors.base04}"

      # Color of text appearing on top of graphs, i.e uptime and current network graph scaling
      theme[graph_text]="#${config.colorScheme.colors.base06}"

      # Background color of the percentage meters
      theme[meter_bg]="#${config.colorScheme.colors.base03}"

      # Misc colors for processes box including mini cpu graphs, details memory graph and details status text
      theme[proc_misc]="#${config.colorScheme.colors.base06}"

      # CPU, Memory, Network, Proc box outline colors
      theme[cpu_box]="#${config.colorScheme.colors.base0E}" #Mauve
      theme[mem_box]="#${config.colorScheme.colors.base0B}" #Green
      theme[net_box]="#${config.colorScheme.colors.base0F}" #Maroon
      theme[proc_box]="#${config.colorScheme.colors.base0D}" #Blue

      # Box divider line and small boxes line color
      theme[div_line]="#${config.colorScheme.colors.base04}"

      # Temperature graph color (Green -> Yellow -> Red)
      theme[temp_start]="#${config.colorScheme.colors.base0B}"
      theme[temp_mid]="#${config.colorScheme.colors.base0A}"
      theme[temp_end]="#${config.colorScheme.colors.base08}"

      # CPU graph colors (Teal -> Lavender)
      theme[cpu_start]="#${config.colorScheme.colors.base0C}"
      theme[cpu_mid]="#${config.colorScheme.colors.base0D}"
      theme[cpu_end]="#${config.colorScheme.colors.base07}"

      # Mem/Disk free meter (Mauve -> Lavender -> Blue)
      theme[free_start]="#${config.colorScheme.colors.base0E}"
      theme[free_mid]="#${config.colorScheme.colors.base07}"
      theme[free_end]="#${config.colorScheme.colors.base0D}"

      # Mem/Disk cached meter (Sapphire -> Lavender)
      theme[cached_start]="#${config.colorScheme.colors.base0E}"
      theme[cached_mid]="#${config.colorScheme.colors.base0D}"
      theme[cached_end]="#${config.colorScheme.colors.base07}"

      # Mem/Disk available meter (Peach -> Red)
      theme[available_start]="#${config.colorScheme.colors.base09}"
      theme[available_mid]="#${config.colorScheme.colors.base0A}"
      theme[available_end]="#${config.colorScheme.colors.base08}"

      # Mem/Disk used meter (Green -> Sky)
      theme[used_start]="#${config.colorScheme.colors.base0B}"
      theme[used_mid]="#${config.colorScheme.colors.base0C}"
      theme[used_end]="#${config.colorScheme.colors.base0D}"

      # Download graph colors (Peach -> Red)
      theme[download_start]="#${config.colorScheme.colors.base0A}"
      theme[download_mid]="#${config.colorScheme.colors.base09}"
      theme[download_end]="#${config.colorScheme.colors.base08}"

      # Upload graph colors (Green -> Sky)
      theme[upload_start]="#${config.colorScheme.colors.base0B}"
      theme[upload_mid]="#${config.colorScheme.colors.base0C}"
      theme[upload_end]="#${config.colorScheme.colors.base0D}"

      # Process box color gradient for threads, mem and cpu usage (Sapphire -> Mauve)
      theme[process_start]="#${config.colorScheme.colors.base0D}"
      theme[process_mid]="#${config.colorScheme.colors.base0C}"
      theme[process_end]="#${config.colorScheme.colors.base0E}"
    '';
  };
}
