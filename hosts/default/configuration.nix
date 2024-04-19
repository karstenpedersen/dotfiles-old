{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/main-user.nix
    inputs.home-manager.nixosModules.default
  ];

  # Hyprland
  programs.hyprland.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # TODO: LOOK AT THIS
  systemd.network.wait-online.enable = false;
  boot.initrd.systemd.network.wait-online.enable = false;

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
    xkb.layout = "us,dk";
    xkb.variant = "";
    xkb.options = "grp:alt_shift_toggle,caps:escape";
    libinput.touchpad.naturalScrolling = true;
  };
  services.displayManager.sddm.enable = true;

  # Keys
  services.gnome.gnome-keyring.enable = true;
  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
    pinentryPackage = lib.mkForce pkgs.pinentry-qt;
  };

  # User 
  main-user = {
    enable = true;
    username = "karsten";
    groups = [
      "adbusers"
      "vboxusers"
      "docker"
    ];
  };
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      "karsten" = import ./home.nix;
    };
  };

  # Android
  programs.adb.enable = true;

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    dconf
    neovim
    git
    gnumake
    nh
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  # Virtualization
  virtualisation.docker.enable = true;
  virtualisation.virtualbox.host.enable = true;
  virtualisation.waydroid.enable = true;
  users.extraGroups.vboxusers.members = [ "karsten" ];
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

  # Settings
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Shell
  users.defaultUserShell = pkgs.bash;

  # System
  system = {
    stateVersion = "unstable";
    # autoUpgrade.enable = true;
    # autoUpgrade.allowReboot = true;
  };

  # Session variables
  environment.sessionVariables = {
    FLAKE = "/home/karsten/dotfiles";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  # Nvidia
  hardware = {
    opengl.enable = true;
    opengl.driSupport32Bit = true;
    nvidia.modesetting.enable = true;
  };

  # Eduroam
  networking.wireless.networks.eduroam = {
    auth = ''
      key_mgmt=WPA-EAP
      eap=PWD
      identity="kpede22@student.sdu.dk"
      password="p@$$w0rd"
    '';
  };

  # Allow man pages
  documentation = {
    enable = true;
    man = {
      man-db.enable = false;
      mandoc.enable = true;
    };
    dev.enable = true;
  };

  # Swaylock
  security.pam.services.swaylock = { };
}
