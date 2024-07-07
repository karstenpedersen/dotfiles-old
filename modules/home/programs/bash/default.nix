{ pkgs, config, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [
      "erasedups"
      "ignoredups"
      "ignorespace"
    ];
    shellAliases = {
      cat = "bat -p";
      gs = "git status";
      lg = "lazygit";
      "g." = "cd ~/dotfiles";
      gv = "cd ~/Nextcloud/vault/";
      gnb = "cd ~/Nextcloud/nb/";
      gcs = "cd ~/Nextcloud/vault/001-education/sdu/bachelor-in-computer-science/4-semester/";
      ll = "exa -alh";
      ls = "exa";
      tree = "exa --tree";
      vi = "nvim";
      zz = "z -";
      gp = "grep";
      fman = "compgen -c | fzf | xargs man";
      ".." = "cd ..";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      mv = "mv -i";
      cp = "cp -i";
      ln = "ln -i";
      top10 = "history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] \" \" CMD[a]/count*100 \"% \" a;}' | grep -v \"./\" | column -c3 -s \" \" -t | sort -nr | nl |  head -n10";
      getpass = "openssl rand -base64 32";
      sha = "shasum -a 256";
    };
  };
}

