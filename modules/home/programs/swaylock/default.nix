{ pkgs, config, ... }:

{
  programs.swaylock = {
    enable = true;
    settings = {
      font="monospace";
      font-size=24;
      indicator-idle-visible=false;
      indicator-radius=200;
      indicator-thickness=30;

      hide-keyboard-layout=true;
      disable-caps-lock-text=true;
      show-failed-attempts=true;

      # Colors
      color=config.colorScheme.colors.base01;
      key-hl-color=config.colorScheme.colors.base06;
      bs-hl-color=config.colorScheme.colors.base06;
      separator-color=config.colorScheme.colors.base06;

      text-color=config.colorScheme.colors.base05;
      text-clear-color=config.colorScheme.colors.base05;
      text-caps-lock-color=config.colorScheme.colors.base01;
      text-ver-color=config.colorScheme.colors.base01;
      text-wrong-color=config.colorScheme.colors.base01;

      inside-color=config.colorScheme.colors.base01;
      inside-clear-color=config.colorScheme.colors.base01;
      inside-caps-lock-color=config.colorScheme.colors.base09;
      inside-ver-color=config.colorScheme.colors.base05;
      inside-wrong-color=config.colorScheme.colors.base08;

      ring-color=config.colorScheme.colors.base02;
      ring-clear-color=config.colorScheme.colors.base02;
      ring-caps-lock-color=config.colorScheme.colors.base09;
      ring-ver-color=config.colorScheme.colors.base05;
      ring-wrong-color=config.colorScheme.colors.base08;

      line-color=config.colorScheme.colors.base01;
      line-clear-color=config.colorScheme.colors.base01;
      line-caps-lock-color=config.colorScheme.colors.base01;
      line-ver-color=config.colorScheme.colors.base01;
      line-wrong-color=config.colorScheme.colors.base01;
    };
  };
}
