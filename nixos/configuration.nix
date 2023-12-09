{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  programs.hyprland.enable = true;

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
    };
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
      "input"
    ];
    useDefaultShell = true;
  };

  # Packages
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    dconf
    neovim
  ];

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  xdg.portal.config.common.default = "*";

  # Fonts
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
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
    experimental-features = ["nix-command" "flakes"];
    auto-optimise-store = true;
  };

  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # System
  system.stateVersion = "unstable";

  # Games
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  # Nvidia
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };
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
}
