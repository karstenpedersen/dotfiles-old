{ pkgs, config, ... }:

{
  home.file = {
    ".config/cheat/conf.yml".text = ''
      ---
      editor: nvim
      colorize: true
      style: catppuccin-mocha
      formatter: terminal256
      pager: less -FRX
      cheatpaths:
        - name: community
          path: /home/karsten/.config/cheat/cheatsheets/community
          tags: [ community ]
          readonly: true
        - name: personal
          path: /home/karsten/.config/cheat/cheatsheets/personal
          tags: [ personal ]
          readonly: false
    '';
  };
}

