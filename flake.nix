{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl.url = "github:nix-community/NixOS-WSL/main";

    nix-colors.url = "github:misterio77/nix-colors";

    # Neovim stuff
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plugin-deadcolumn-nvim = {
      url = "github:bekaboo/deadcolumn.nvim";
      flake = false;
    };
  };

  outputs = { nixpkgs, utils, ... }@inputs:
    {
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/default/configuration.nix
            utils.nixosModules.autoGenFromInputs
            inputs.home-manager.nixosModules.default
            inputs.sops-nix.nixosModules.sops
          ];
          specialArgs = { inherit inputs; };
        };
        wsl = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./hosts/wsl/configuration.nix
            inputs.nixos-wsl.nixosModules.default
          ];
        };
      };
    };
}
