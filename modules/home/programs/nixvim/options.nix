{ ... }:

{
  programs.nixvim.opts = {
    number = true;
    relativenumber = true;
    colorcolumn = "80";
    wildmenu = true;
    showmatch = true;
    cursorline = true;
    showcmd = true;
    list = true;
    listchars = "tab:» ,trail:·,nbsp:␣";
    inccommand = "nosplit";

    # Indentation
    tabstop = 2;
    softtabstop = 2;
    shiftwidth = 2;
    shiftround = true;
    expandtab = true;
    smartindent = true;
    autoindent = true;
    scrolloff = 8;
    sidescrolloff = 6;
    wrap = false;

    # Search
    hlsearch = true;
    incsearch = true;
    ignorecase = true;
    smartcase = true;

    # Split
    splitright = true;
    splitbelow = true;

    clipboard.register = "unnamedplus";

    # Menus
    pumheight = 16;
    completeopt = [
      "menu"
      "menuone"
      "noselect"
    ];
  };
}
