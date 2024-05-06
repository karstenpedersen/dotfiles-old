{
  description = "NixOS Config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-colors.url = "github:misterio77/nix-colors";
    hyprland.url = "github:hyprwm/Hyprland";
    utils.url = "github:gytis-ivaskevicius/flake-utils-plus";
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

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

  outputs = { self, nixpkgs, utils, ... }@inputs:
    {
      nixosModules = import ./modules { lib = nixpkgs.lib; };
      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          modules = [
            ./hosts/default/configuration.nix
            utils.nixosModules.autoGenFromInputs
            inputs.home-manager.nixosModules.default
            inputs.hyprland.nixosModules.default
          ];
          specialArgs = { inherit inputs; };
        };
      };
    };
}
