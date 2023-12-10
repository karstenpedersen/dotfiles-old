
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
      editor.promptContext = true; # TODO - Prezto prompt context
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
    };
    shellAliases = {};
  };
  # environment.pathsToLink = [ "/share/zsh" ];


}
