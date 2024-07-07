{ config, ... }:

{
  sops.secrets = {
    "sdu-email" = {
      owner = config.users.users.karsten.name;
      inherit (config.users.users.karsten) group;
    };
    "sdu-eduroam-password" = {
      owner = config.users.users.karsten.name;
      inherit (config.users.users.karsten) group;
    };
  };

  networking.wireless.networks.eduroam = {
    auth = ''
      key_mgmt=WPA-EAP
      eap=PWD
      identity="${config.sops.secrets."sdu-email".path}"
      password="${config.sops.secrets."sdu-eduroam-password".path}"
    '';
  };
}
