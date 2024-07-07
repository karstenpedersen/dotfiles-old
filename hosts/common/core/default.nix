{ inputs, outputs, ... }:

{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./nix.nix
    ./sops.nix
    ./locale.nix
  ];
  # ++ (builtins.attrValues outputs.nixosModules);

  home-manager = {
    extraSpecialArgs = { inherit inputs outputs; };
    backupFileExtension = "hm-backup";
  };

  nixpkgs = {
    # overlays = builtins.attrValues outputs.overlays;
    config.allowUnfree = true;
  };
}
