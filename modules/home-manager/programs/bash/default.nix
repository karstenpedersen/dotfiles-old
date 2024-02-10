{ pkgs, config, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyFile = "~/.bash_history";
    historyIgnore = [
      "ls"
      "ll"
      "tree"
      "cd"
      "exit"
    ];
    shellAliases = {
      cat = "bat";
      c = "clear";
      cd = "z";
      gs = "git status";
      "g." = "cd ~/dotfiles";
      gv = "cd ~/Nextcloud/vault/";
      gcs = "cd ~/Nextcloud/vault/001-education/sdu/bachelor-in-computer-science/4-semester/";
      lg = "lazygit";
      ll = "exa -alh";
      ls = "exa";
      tree = "exa --tree";
      vi = "nvim";
      v = "nvim";
      zat = "zathura";
      zz = "z -";
      gp = "grep";
    };
  };
}

