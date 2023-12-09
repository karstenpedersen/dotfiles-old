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
      marksman
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
        plugin = nvim-base16;
        config = toLua ''
          require('base16-colorscheme').setup({
            base00 = '#${config.colorScheme.colors.base00}',
            base01 = '#${config.colorScheme.colors.base01}',
            base02 = '#${config.colorScheme.colors.base02}',
            base03 = '#${config.colorScheme.colors.base03}',
            base04 = '#${config.colorScheme.colors.base04}',
            base05 = '#${config.colorScheme.colors.base05}',
            base06 = '#${config.colorScheme.colors.base06}',
            base07 = '#${config.colorScheme.colors.base07}',
            base08 = '#${config.colorScheme.colors.base08}',
            base09 = '#${config.colorScheme.colors.base09}',
            base0A = '#${config.colorScheme.colors.base0A}',
            base0B = '#${config.colorScheme.colors.base0B}',
            base0C = '#${config.colorScheme.colors.base0C}',
            base0D = '#${config.colorScheme.colors.base0D}',
            base0E = '#${config.colorScheme.colors.base0E}',
            base0F = '#${config.colorScheme.colors.base0F}',
          })
        '';
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
