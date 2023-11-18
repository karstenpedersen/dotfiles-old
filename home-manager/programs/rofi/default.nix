{ pkgs, config, ... }:

{
  programs.rofi = {
    enable = true;
    pass.enable = true;
    font = "Fira Mono 12";
    theme = let inherit (config.lib.formats.rasi) mkLiteral; in {
      "*" = {
        urgent = mkLiteral "#${config.colorScheme.colors.base0D}"; 
        background = mkLiteral "#${config.colorScheme.colors.base00}"; 
        background-alt = mkLiteral "#11111b";
        foreground = mkLiteral "#${config.colorScheme.colors.base0E}";
        foreground-alt = mkLiteral "#${config.colorScheme.colors.base05}";
        foreground-active = mkLiteral "#${config.colorScheme.colors.base0E}";
        foreground-active-alt = mkLiteral "#${config.colorScheme.colors.base05}";  

        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground";
        accent-color = mkLiteral "@foreground";

        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        spacing = mkLiteral "0px";

        width = mkLiteral "850px";
      };
      window = {
        background-color = mkLiteral "@background";
        border-color = mkLiteral "@background-alt";
        location = mkLiteral "center";
        width = mkLiteral "480px";
        border = mkLiteral "0px";
      };
      inputbar = {
        background-color = mkLiteral "@background-alt";
        padding = mkLiteral "8px 12px";
        spacing = mkLiteral "12px";
        children = mkLiteral "[prompt, entry]";
      };
      "prompt, entry, element-text, element-icon" = {
        vertical-align = mkLiteral "0.5";
      };
      prompt = {
        text-color = mkLiteral "@foreground";
      };
      listview = {
        lines = 10;
        columns = 1;
        fixed-height = false;
      };
      element = {
        text-color = mkLiteral "@foreground-alt";
        padding = mkLiteral "8px";
        spacing = mkLiteral "8px";
      };
      "element normal urgent" = {
        text-color = mkLiteral "@urgent";
      };
      "element selected" = {
        text-color = mkLiteral "@foreground";
      };
      "element selected normal" = {
        text-color = mkLiteral "@foreground";
      };
      "element selected urgent" = {
        text-color = mkLiteral "@urgent";
      };
      "element normal active" = {
        text-color = mkLiteral "@foreground-active-alt";
      };
      "element selected active" = {
        text-color = mkLiteral "@foreground-active";
      };
      "element-icon" = {
        size = mkLiteral "0.75em";
      };
      "element-text" = {
        text-color = mkLiteral "inherit";
      };
    };
    extraConfig = {
      show-icons = true;
      terminal = "kitty";
    };
  };
}
