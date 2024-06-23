{ pkgs, ... }:

{
  fontProfiles = {
    enable = true;
    monospace = {
      family = "FiraMono Nerd Font";
      package = pkgs.firaMono;
    };
    regular = {
      family = "Fira Sans";
      package = pkgs.fira;
    };
  };
}

