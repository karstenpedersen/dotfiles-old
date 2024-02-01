{ pkgs, config, ... }:

{
  programs.bash = {
    enable = true;
    enableCompletion = true;
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
      v = "nvim";
    };
  };
}

