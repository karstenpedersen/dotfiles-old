{ pkgs, config, ... }:

{
  programs.yazi.enable = true;
  home.file = {
    ".config/yazi/theme.toml".text = ''
      [flavor]
      use = "catppuccin-mocha"
    '';
    ".config/yazi/flavors".source = ./flavors;
  };
  programs.bash.initExtra = ''
    function yy() {
      local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
    }
  '';
}

