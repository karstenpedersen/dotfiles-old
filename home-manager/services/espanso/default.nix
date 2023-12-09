{ pkgs, config, ... }:

{
  services.espanso = {
    enable = true;
    package = pkgs.espanso-wayland;
    matches = {
      base = {
        matches = [
          {
            trigger = ";date";
            replace = "{{currentdate}}";
          }
        ];
      };
      me = {
        matches = [
          {
            trigger = ";m.n";
            replace = "Karsten Pedersen";
          }
          {
            trigger = ";m.fn";
            replace = "Karsten F. Pedersen";
          }
          {
            trigger = ";m.ffn";
            replace = "Karsten Finderup Pedersen";
          }
          {
            trigger = ";m.e";
            replace = "karstenfp.all@gmail.com";
          }
        ];
      };
      global_vars = {
        global_vars = [
          {
            name = "currentdate";
            type = "date";
            params = {format = "%d/%m/%Y";};
          }
          {
            name = "currenttime";
            type = "date";
            params = {format = "%R";};
          }
        ];
      };
    };
  };
}
