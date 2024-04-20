{ pkgs, config, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      vscodevim.vim
      prisma.prisma
      haskell.haskell
      eamodio.gitlens
      mikestead.dotenv
      usernamehw.errorlens
      streetsidesoftware.code-spell-checker
      svelte.svelte-vscode
      esbenp.prettier-vscode
      bradlc.vscode-tailwindcss
      tomoki1207.pdf
      ms-python.python
      ms-azuretools.vscode-docker
      ms-toolsai.jupyter
      ms-toolsai.jupyter-keymap
      ms-toolsai.jupyter-renderers
      ms-vscode-remote.remote-ssh
      arrterian.nix-env-selector
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
    ];
    userSettings = {
      "workbench.startupEditor" = "none";
      "workbench.sideBar.location" = "right";
      "workbench.editor.wrapTabs" = true;
      "explorer.compactFolders" = false;
      "editor.minimap.enabled" = false;
      "editor.folding" = false;
      "window.menuBarVisibility" = "toggle";
      "terminal.integrated.fontFamily" = "FiraMono";
      "[nix].editor.tabSize" = 2;
    };
  };
  home.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };
}

