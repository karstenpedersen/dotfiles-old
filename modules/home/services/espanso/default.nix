{ ... }:

{
  services.espanso = {
    enable = true;
    matches = {
      base = {
        matches = [
          {
            trigger = ";date;";
            replace = "{{currentdate}}";
          }
          {
            trigger = ";time;";
            replace = "{{currenttime}}";
          }
        ];
      };
      me = {
        matches = [
          {
            trigger = ";m.n;";
            replace = "Karsten";
          }
          {
            trigger = ";m.nn;";
            replace = "Karsten Pedersen";
          }
          {
            trigger = ";m.fn;";
            replace = "Karsten F. Pedersen";
          }
          {
            trigger = ";m.ffn;";
            replace = "Karsten Finderup Pedersen";
          }
          {
            trigger = ";m.e;";
            replace = "karstenfp.all@gmail.com";
          }
          {
            trigger = ";br;";
            replace = "Best Regards,\nKarsten Pedersen";
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
