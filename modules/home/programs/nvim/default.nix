{ config, pkgs, inputs, ... }:

{
  # Add plugins from github
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          own-my-nvim-config = prev.vimUtils.buildVimPlugin {
            name = "my-nvim-config";
            src = ./nvim;
          };
          own-deadcolumn-nvim = prev.vimUtils.buildVimPlugin {
            name = "deadcolumn";
            src = inputs.plugin-deadcolumn-nvim;
          };
        };
      })
    ];
  };

  programs.neovim =
    let
      toLua = str: "lua << EOF\n${str}\nEOF\n";
      toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
    in
    {
      enable = true;
      extraLuaConfig = ''
        ${builtins.readFile ./nvim/init.lua}
      '';
      extraPackages = with pkgs; [
        # lua-language-server
        # rnix-lsp
        # marksman
      ];
      plugins = with pkgs.vimPlugins; [
        telescope-nvim
        telescope-fzf-native-nvim
        which-key-nvim
        gitsigns-nvim
        mini-nvim
        nvim-treesitter.withAllGrammars
        nvim-treesitter-textobjects
        nvim-treesitter-refactor
        nvim-colorizer-lua
        harpoon
        # neodev-nvim
        # cmp_luasnip
        # cmp-nvim-lsp
        luasnip
        friendly-snippets
        lazygit-nvim
        vim-tmux-navigator
        vim-pandoc
        vim-pandoc-syntax

        # own-my-nvim-config
      ];
    };

  # FTPlugin folder
  # home.file."~/.config/nvim".source = ./nvim;
  # home.file."~/.config/nvim/lua/karsten/variables.lua".text = ''
  #   return {
  #     palette16 = {
  #       base00 = '#${config.colorScheme.colors.base00}',
  #       base01 = '#${config.colorScheme.colors.base01}',
  #       base02 = '#${config.colorScheme.colors.base02}',
  #       base03 = '#${config.colorScheme.colors.base03}',
  #       base04 = '#${config.colorScheme.colors.base04}',
  #       base05 = '#${config.colorScheme.colors.base05}',
  #       base06 = '#${config.colorScheme.colors.base06}',
  #       base07 = '#${config.colorScheme.colors.base07}',
  #       base08 = '#${config.colorScheme.colors.base08}',
  #       base09 = '#${config.colorScheme.colors.base09}',
  #       base0A = '#${config.colorScheme.colors.base0A}',
  #       base0B = '#${config.colorScheme.colors.base0B}',
  #       base0C = '#${config.colorScheme.colors.base0C}',
  #       base0D = '#${config.colorScheme.colors.base0D}',
  #       base0E = '#${config.colorScheme.colors.base0E}',
  #       base0F = '#${config.colorScheme.colors.base0F}',
  #     }
  #   }
  # '';
}

        # {
        #   plugin = nvim-lspconfig;
        #   config = toLuaFile ./lua/plugins/lsp.lua;
        # }
        # {
        #   plugin = nvim-cmp;
        #   config = toLuaFile ./lua/plugins/cmp.lua;
        # }
        # {
        #   plugin = vimtex;
        #   config = toLuaFile ./lua/plugins/vimtex.lua;
        # }
        # {
        #   plugin = own-obsidian-nvim;
        #   config = toLuaFile ./lua/plugins/obsidian-nvim.lua;
        # }
        # {
        #   plugin = own-deadcolumn-nvim;
        #   config = toLuaFile ./lua/plugins/deadcolumn-nvim.lua;
        # }

        # {
        #   plugin = (nvim-treesitter.withPlugins (p: [
        #     p.tree-sitter-nix
        #     p.tree-sitter-vim
        #     p.tree-sitter-bash
        #     p.tree-sitter-lua
        #     p.tree-sitter-python
        #     p.tree-sitter-json
        #     p.tree-sitter-typescript
        #     p.tree-sitter-yaml
        #     p.tree-sitter-toml
        #     p.tree-sitter-tsx
        #     p.tree-sitter-rust
        #     p.tree-sitter-svelte
        #     p.tree-sitter-sql
        #     p.tree-sitter-python
        #     p.tree-sitter-markdown
        #     p.tree-sitter-latex
        #     p.tree-sitter-jsdoc
        #     p.tree-sitter-javascript
        #     p.tree-sitter-html
        #     p.tree-sitter-haskell
        #     p.tree-sitter-cpp
        #     p.tree-sitter-c
        #     p.tree-sitter-bibtex
        #   ]));
        # }
