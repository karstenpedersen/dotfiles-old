{ inputs, lib, config, pkgs, ... }:

{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./programs/kitty/kitty.nix
    ./programs/lf/lf.nix
    ./programs/nvim/nvim.nix
    ./programs/vscode/vscode.nix
    ./programs/rofi/rofi.nix
    ./programs/qutebrowser/qutebrowser.nix
  ];

  nixpkgs = {
    overlays = [];
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true; # bug: https://github.com/nix-community/home-manager/issues/2942
    };
  };

  home.username = "karsten";
  home.homeDirectory = "/home/karsten";
  home.stateVersion = "23.05";
 
  # Colorscheme
  colorScheme = inputs.nix-colors.colorSchemes.catppuccin-mocha;

  # environment.systemPackages = with pkgs; [
  home.packages = with pkgs; [
    pamixer
    btop
    git
    devbox
    autojump
    lf
    gcc
    pass
    gnupg
    kitty
    zathura
    tectonic
    zotero
    obsidian
    firefox
    discord
    spotify
    nextcloud-client
    vscodium
    rofi
    xcolor
    xclip
    xdragon
    pistol
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-24.8.6" # Used for obsidian
  ];
  
  # Dotfiles
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
  };

  # Environment
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  # Git
  programs.git = {
    enable = true;
    userName  = "Karsten Pedersen";
    userEmail = "karstenfp.all@gmail.com";

    aliases = {
      pu = "push";
      cm = "commit";
      co = "checkout";
      sw = "switch";
      s = "status";
    };
  };

  # Firefox
  # nix flake show "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons" 
  programs.firefox = {
    enable = true;
    profiles.karsten = {
      search.engines = {};
      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        duckduckgo-privacy-essentials
        firefox-color                
        markdownload                 
        react-devtools               
        vimium                       
      ];
    };
  };

  # Gtk
  gtk = {
    enable = true;
    theme.name = "adw-gtk3";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "GruvboxPlus";
  };

  # Mime types
  xdg.mimeApps.defaultApplications = {
    "text/*" = ["nvim.desktop"];
    "application/pdf" = ["zathura.desktop"];
  };

  # Shell
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
  };
}
