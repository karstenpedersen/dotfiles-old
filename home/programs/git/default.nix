{ config, pkgs, inputs, ... }:

{
  programs.git = {
    enable = true;
    userName  = "Karsten Pedersen";
    userEmail = "karstenfp.all@gmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
    aliases = {
      pu = "push";
      cm = "commit";
      co = "checkout";
      sw = "switch";
      s = "status";
    };
  };
}
