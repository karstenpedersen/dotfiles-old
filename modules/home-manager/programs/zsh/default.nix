{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    dirHashes = {
      docs = "$HOME/Documents";
      proj = "$HOME/Projects";
      next = "$HOME/Nextcloud";
      vault = "$HOME/Nextcloud/vault";
      dot = "$HOME/dotfiles/";
    };
    dotDir = ".config/zsh";
    history = {
      ignoreAllDups = true;
      ignoreSpace = true;
      ignorePatterns = [
        "rm *"
      ];
    };
    prezto = {
      enable = true;
      caseSensitive = false;
      editor.dotExpansion = true;
      editor.promptContext = true;
      syntaxHighlighting = {
        highlighters = [
          "main"
          "brackets"
          "pattern"
          "line"
          "cursor"
          "root"
        ];
      };
      prompt.theme = "pure";
    };
    shellAliases = {
      ls = "exa";
      ll = "exa -alh";
      tree = "exa --tree";
      cat = "bat";
      cd = "z";
      zz = "z -";
      zat = "zathura";
      lg = "lazygit";
      vi = "nvim";
    };
  };
}
