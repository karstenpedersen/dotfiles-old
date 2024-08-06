{ pkgs, ... }:

{
  services = {
    displayManager = {
      defaultSession = "none+awesome";
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
        variant = "";
        options = "caps:escape";
      };
      windowManager.awesome = {
        enable = true;
        luaModules = with pkgs.luaPackages; [
          luarocks
          luadbi-mysql
        ];
      };
    };
  };
}
