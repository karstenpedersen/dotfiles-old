{ pkgs, ... }:

{
  import = [
    ../common/optional/documentation.nix
  ];

  wsl = {
    enable = true;
    docker-desktop.enable = true;
  };
  system = {
    stateVersion = "24.05";
    autoUpgrade.enable = true;
  };

  nix = {
    # From flake-utils-plus
    generateNixPathFromInputs = true;
    generateRegistryFromInputs = true;
    linkInputs = true;
  };

  # User 
  users.users.nixos = {
    isNormalUser = true;
    groups = [
      "docker"
    ];
  };
  home-manager.users.nixos = import ./home.nix;

  # Packages
  environment.systemPackages = with pkgs; [
    vi
    wget
  ];
  programs.nix-ld = {
    enable = true;
    package = pkgs.nix-ld-rs;
  };

  # Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "nixos" ];
}

