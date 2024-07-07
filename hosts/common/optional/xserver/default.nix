{ pkgs, ... }:

{
  services = {
    displayManager = {
      defaultSession = "none+awesome";
    };
    xserver = {
      enable = true;
      xkb = {
        layout = "us,dk";
        variant = "";
        options = "grp:alt_shift_toggle,caps:escape";
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
