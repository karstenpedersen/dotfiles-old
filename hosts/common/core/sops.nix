{ lib, inputs, config, ... }:

let
  cfg = config.host.sops;
in
{
  imports = [
    # inputs.sops-nix.nixosModules.sops
  ];

  options.host.sops = {
    sopsFile = lib.mkOption {
      default = ../../../secrets.yaml;
      description = ''
        secrets file
      '';
    };
    sshKeyPaths = lib.mkOption {
      default = [ "/etc/ssh/ssh_host_ed25519_key" ];
      description = ''
        hosts SSH key location
      '';
    };
    keyFile = lib.mkOption {
      default = "/var/lib/sops-nix/key.txt";
      description = ''
        new key location
      '';
    };
  };

  config.sops = {
    defaultSopsFile = cfg.sopsFile;
    validateSopsFiles = false;
    age = {
      sshKeyPaths = cfg.sshKeyPaths;
      keyFile = cfg.keyFile;
      generateKey = true;
    };
    secrets = {};
  };
}
