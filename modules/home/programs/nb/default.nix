{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    nb
  ];
  home.file = {
    ".nbrc".text = ''
      export NB_DIR="/home/karsten/Nextcloud/nb"
      export NB_COLOR_THEME="catppuccin"

      export NB_INDICATOR_AUDIO="🔉"
      export NB_INDICATOR_BOOKMARK=" "
      export NB_INDICATOR_DOCUMENT=" "
      export NB_INDICATOR_EBOOK=" "
      export NB_INDICATOR_ENCRYPTED="🔒"
      export NB_INDICATOR_FOLDER=" "
      export NB_INDICATOR_IMAGE=" "
      export NB_INDICATOR_PINNED=" "
      export NB_INDICATOR_TODO="✔️ "
      export NB_INDICATOR_TODO_DONE="✅"
      export NB_INDICATOR_VIDEO="📹"
    '';
  };
}

