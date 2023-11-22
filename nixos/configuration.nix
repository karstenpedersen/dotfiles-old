{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  networking.hostName = "nixos"; # Define your hostname.

  # i18n
  time.timeZone = "Europe/Copenhagen";
  i18n.defaultLocale = "en_DK.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "da_DK.UTF-8";
    LC_IDENTIFICATION = "da_DK.UTF-8";
    LC_MEASUREMENT = "da_DK.UTF-8";
    LC_MONETARY = "da_DK.UTF-8";
    LC_NAME = "da_DK.UTF-8";
    LC_NUMERIC = "da_DK.UTF-8";
    LC_PAPER = "da_DK.UTF-8";
    LC_TELEPHONE = "da_DK.UTF-8";
    LC_TIME = "da_DK.UTF-8";
  };

  # XServer 
  services.xserver = {
    enable = true;
    layout = "us,dk";
    xkbVariant = "";
    xkbOptions = "grp:alt_shift_toggle,caps:escape";
    libinput.touchpad.naturalScrolling = true;
    displayManager = {
      sddm.enable = true;
      defaultSession = "none+awesome";
    };
    windowManager.awesome = {
      enable = true;
      luaModules = with pkgs.luaPackages; [
        luarocks
        luadbi-mysql
      ];
    };
    excludePackages = with pkgs; [
      xterm
    ];
  };

  # Keys
  services.gnome.gnome-keyring.enable = true;
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  # User 
  users.users.karsten = {
    isNormalUser = true;
    description = "karsten";
    extraGroups = [
      "networkmanager"
      "wheel"
      "audio"
      "video"
    ];
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    dconf
    neovim
  ];

  # Fonts
  fonts = {
    enableDefaultFonts = true;
    fonts = with pkgs; [
      noto-fonts
      noto-fonts-emoji
      noto-fonts-extra
      twemoji-color-font
      (nerdfonts.override { fonts = ["FiraMono"]; })
    ];
    fontconfig = {
      defaultFonts = {
        serif = [ "Noto Serif" ];
        sansSerif = [ "Noto Sans" ];
        monospace = [ "Fira Mono" ];
      };
    };
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
  };

  # Audio
  hardware.pulseaudio.enable = true;

  # Bluetooth
  hardware.bluetooth.enable = true;

  # Screen brightness
  programs.light.enable = true;

  # Settings
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  # System
  system.stateVersion = "23.05";
}
