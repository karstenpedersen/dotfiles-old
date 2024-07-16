{ lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/core
    ../common/optional/xserver
    ../common/optional/virtualization.nix
    ../common/optional/documentation.nix
    ../../modules/nixos/main-user.nix
    ../../modules/nixos/devices/MXVerticalAdvancedErgonomicMouse
  ];

  # System
  system = {
    stateVersion = "24.05";
    # autoUpgrade.enable = true;
    # autoUpgrade.allowReboot = true;
  };

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "laptop";

  services = {
    displayManager.sddm.enable = true;
    libinput.touchpad.naturalScrolling = true;
    udev.extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
    '';
  };

  # Keys
  services.gnome.gnome-keyring.enable = true;
  services.pcscd.enable = true;

  # User 
  main-user = {
    enable = true;
    username = "karsten";
    groups = [
      "adbusers"
      "docker"
      "libvirtd"
      "kvm"
    ];
  };
  home-manager.users.karsten = import ./home.nix;

  # Packages
  environment.systemPackages = with pkgs; [
    chromium
    neovim
    git
    gnumake
    just
    nh
    fh
    wget
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  # Docker
  virtualisation.docker.enable = true;
  users.extraGroups.docker.members = [ "karsten" ];

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra
      twemoji-color-font
      (nerdfonts.override { fonts = [ "FiraMono" ]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Fira Mono" ];
      };
    };
  };

  # Audio
  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Session variables
  environment = {
    sessionVariables = {
      FLAKE = "/home/karsten/dotfiles";
      WLR_NO_HARDWARE_CURSORS = "1";
      NIXOS_OZONE_WL = "1";
    };
  };

  # Nvidia
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement = {
        enable = true;
        finegrained = true;
      };
      prime = {
        # offload.enable = true;
        amdgpuBusId = "PCI:1:0:0";
        nvidiaBusId = "PCI:7:0:0";
      };
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      # nvidiaSettings = true;
    };
  };
}
