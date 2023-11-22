{ config, pkgs, ... }:

{
  programs.neovim = 
  let
    toLua = str: "lua << EOF\n${str}\nEOF\n";
    toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
  in 
  {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraLuaConfig = ''
      ${builtins.readFile ./lua/core/options.lua}
      ${builtins.readFile ./lua/core/mappings.lua}
    '';
    extraPackages = with pkgs; [
      lua-language-server
      rnix-lsp
      nodePackages.svelte-language-server
      nodePackages.typescript-language-server
      nodePackages.vscode-json-languageserver
      rust-analyzer
      marksman
      # haskell-language-server
      # nodePackages.pyright
    ];
    plugins = with pkgs.vimPlugins; [
      {
        plugin = nvim-lspconfig;
        config = toLuaFile ./lua/plugins/lsp.lua;
      }
      {
        plugin = nvim-cmp;
        config = toLuaFile ./lua/plugins/cmp.lua;
      }
      {
        plugin = telescope-nvim;
        config = toLuaFile ./lua/plugins/telescope.lua;
      }
      {
        plugin = which-key-nvim;
        config = toLuaFile ./lua/plugins/which-key.lua;
      }
      {
        plugin = vimtex;
        config = toLuaFile ./lua/plugins/vimtex.lua;
      }
      {
        plugin = gitsigns-nvim;
        config = toLuaFile ./lua/plugins/gitsigns.lua;
      }
      {
        plugin = lualine-nvim;
        config = toLuaFile ./lua/plugins/lualine.lua;
      }
      {
        plugin = (nvim-treesitter.withPlugins (p: [
          p.tree-sitter-nix
          p.tree-sitter-vim
          p.tree-sitter-bash
          p.tree-sitter-lua
          p.tree-sitter-python
          p.tree-sitter-json
          p.tree-sitter-typescript
          p.tree-sitter-yaml
          p.tree-sitter-toml
          p.tree-sitter-tsx
          p.tree-sitter-rust
          p.tree-sitter-svelte
          p.tree-sitter-sql
          p.tree-sitter-python
          p.tree-sitter-markdown
          p.tree-sitter-latex
          p.tree-sitter-jsdoc
          p.tree-sitter-javascript
          p.tree-sitter-html
          p.tree-sitter-haskell
          p.tree-sitter-cpp
          p.tree-sitter-c
          p.tree-sitter-bibtex
        ]));
        config = toLuaFile ./lua/plugins/treesitter.lua;
      }
      {
        plugin = comment-nvim;
        config = toLua "require('Comment').setup()";
      }
      {
        plugin = nvim-colorizer-lua;
        config = toLua "require('colorizer').setup()";
      }
      indent-blankline-nvim
      telescope-fzf-native-nvim
      harpoon
      neodev-nvim
      cmp_luasnip
      cmp-nvim-lsp
      luasnip
      friendly-snippets
      vim-fugitive
    ];
  };
}
