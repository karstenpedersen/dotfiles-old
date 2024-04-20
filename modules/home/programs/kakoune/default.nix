{ pkgs, config, ... }:

{
  imports = [
    ./theme.nix
  ];
  programs.kakoune = {
    enable = true;
    extraConfig = ''
      colorscheme theme
      set-option global tabstop 2
      set-option global indentwidth 2
      set-option global scrolloff 8,4

      add-highlighter global/ number-lines -hlcursor -relative
      add-highlighter global/ show-matching

      # Highlight trailing whitespace
      add-highlighter global/ regex \h+$ 0:Error

			# Keymaps
      map global user f ':fzf-mode<ret>'
    '';
    plugins = with pkgs.kakounePlugins; [
			fzf-kak
		];
  };
}
