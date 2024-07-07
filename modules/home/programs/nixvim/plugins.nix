{ config, pkgs, inputs, ... }:

{
  nixpkgs = {
    overlays = [
      (final: prev: {
        vimPlugins = prev.vimPlugins // {
          own-deadcolumn-nvim = prev.vimUtils.buildVimPlugin {
            name = "deadcolumn";
            src = inputs.plugin-deadcolumn-nvim;
          };
        };
      })
    ];
  };

  programs.nixvim = {
    plugins = {
      lsp = {
        enable = true;
        servers = {
          rust-analyzer = {
            enable = true;
            installCargo = true;
            installRustc = true;
          };
          ccls.enable = true;
          cmake.enable = true;
          pylsp.enable = true;
          java-language-server.enable = true;
          tsserver.enable = true;
          jsonls.enable = true;
          cssls.enable = true;
          html.enable = true;
          htmx.enable = true;
          gopls.enable = true;
          templ.enable = true;
          sqls.enable = true;
          emmet-ls.enable = true;
          eslint.enable = true;
          svelte.enable = true;
          astro.enable = true;
          tailwindcss.enable = true;
          texlab.enable = true;
          # rnix-lsp.enable = true;
          nixd.enable = true;
          hls.enable = true;
          lua-ls.enable = true;
          marksman.enable = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "luasnip"; }
            { name = "buffer"; }
            { name = "path"; }
            { name = "latex-symbols"; }
          ];
          mapping = {
            __raw = ''
              cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i', 'c'}),
                ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i', 'c'}), 
                ["<C-y>"] = cmp.mapping(cmp.mapping.confirm({ select = true }, {'i', 'c'}))
              })
            '';
          };
          snippet.expand = "luasnip";
        };
        filetype = {
          gitcommit = {
            sources = [
              { name = "git"; }
            ];
          };
        };
      };
      telescope.enable = true;
      trouble.enable = true;
      oil = {
        enable = true;
        settings.delete_to_trash = true;
      };
      treesitter.enable = true;
      treesitter-context = {
        enable = true;
        settings.max-lines = 5;
      };
      treesitter-textobjects.enable = true;
      refactoring.enable = true;
      luasnip = {
        enable = true;
        fromLua = [
          {
            paths = ./lua/luasnip.lua;
          }
        ];
      };
      harpoon.enable = true;
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
        };
      };
      ts-autotag.enable = true;
      surround.enable = true;
      which-key.enable = true;
      todo-comments.enable = true;
      comment.enable = true;
      emmet.enable = true;
      undotree.enable = true;
      diffview.enable = true;

      # TMUX
      tmux-navigator.enable = true;

      # Writing
      goyo = {
        enable = true;
        settings = {
          linenr = true;
          height = 100;
        };
      };
      markdown-preview.enable = true;

      # Visual
      nvim-colorizer.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; [
      own-deadcolumn-nvim
    ];
  };
}
