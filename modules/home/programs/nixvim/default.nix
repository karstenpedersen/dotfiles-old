{ config, pkgs, inputs, lib, ... }:

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
    enable = true;
    globals.mapleader = " ";
    globals.maplocalleader = " ";
    opts = {
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
      splitbelow = true;
      splitright = true;

      clipboard = "unnamedplus";

      # Menus
      pumheight = 16;
      completeopt = [
        "menu"
        "menuone"
        "noselect"
      ];
    };
    # colorschemes.base16 = {
    #   enable = true;
    #   colorscheme = builtins.mapAttrs (name: value: "#${value}") config.colorScheme.palette;
    # };
    colorschemes.catppuccin.enable = true;
    keymaps = [
      {
        key = "-";
        action = "<cmd>Oil<cr>";
        options.desc = "Open Oil";
      }
      {
        key = "<leader>m";
        action = "<cmd>!make<cr>";
        options.desc = "Make";
      }
      # {
      #   key = "[c";
      #   action.action = helpers.mkRaw "function() require('treesitter-context').go_to_context(vim.v.count1) end";
      #   options.desc = "Goto implementation";
      # }

      # Overrides
      {
        key = "<c-d>";
        action = "<c-d>zz";
        options.desc = "Half page down";
      }
      {
        key = "<c-u>";
        action = "<c-u>zz";
        options.desc = "Half page up";
      }
      {
        key = "n";
        action = "nzzzv";
        options.desc = "Find next match";
      }
      {
        key = "N";
        action = "Nzzzv";
        options.desc = "Find previous match";
      }
      {
        key = "<c-j>";
        action = "<c-w><c-j>";
        options.desc = "Navigate down";
      }
      {
        key = "<c-k>";
        action = "<c-w><c-k>";
        options.desc = "Navigate up";
      }
      {
        key = "<c-l>";
        action = "<c-w><c-l>";
        options.desc = "Navigate right";
      }
      {
        key = "<c-h>";
        action = "<c-w><c-h>";
        options.desc = "Navigate left";
      }
      {
        key = "<m-h>";
        action = "<c-w>5<";
        options.desc = "Shrink split";
        options.silent = true;
      }
      {
        key = "<m-l>";
        action = "<c-w>5>";
        options.desc = "Widen split";
        options.silent = true;
      }
      {
        key = "<m-k>";
        action = "<c-w>+";
        options.desc = "Make split taller";
        options.silent = true;
      }
      {
        key = "<m-j>";
        action = "<c-w>-";
        options.desc = "Make split shorter";
        options.silent = true;
      }

      # Telescope
      {
        key = "<leader>tf";
        action = "<cmd>Telescope find_files<cr>";
        options.desc = "Find files";
      }
      {
        key = "<leader>tg";
        action = "<cmd>Telescope live_grep<cr>";
        options.desc = "Live grep";
      }

      # Refactoring
      {
        mode = "x";
        key = "<leader>re";
        action = "<cmd>Refactor extract <cr>";
        options.desc = "Extract to function";
      }
      {
        mode = "x";
        key = "<leader>rf";
        action = "<cmd>Refactor extract_to_file <cr>";
        options.desc = "Extract to file";
      }
      {
        mode = "x";
        key = "<leader>rv";
        action = "<cmd>Refactor extract_var <cr>";
        options.desc = "Extract to var";
      }
      {
        mode = [ "n" "x" ];
        key = "<leader>ri";
        action = "<cmd>Refactor inline_var<cr>";
        options.desc = "Extract to inline var";
      }
      {
        mode = "n";
        key = "<leader>rI";
        action = "<cmd>Refactor inline_func<cr>";
        options.desc = "Extract to inline var";
      }
      {
        mode = "n";
        key = "<leader>rb";
        action = "<cmd>Refactor extract_block<cr>";
        options.desc = "Extract block";
      }
      {
        mode = "n";
        key = "<leader>rbf";
        action = "<cmd>Refactor extract_block_to_file<cr>";
        options.desc = "Extract block to file";
      }

      # LSP
      # {
      #   key = "<leader>r";
      #   action = helpers.mkRaw "function() vim.lsp.buf.rename() end";
      #   options.desc = "Rename";
      # }
      # {
      #   key = "<leader>a";
      #   action = helpers.mkRaw "function() vim.lsp.buf.code_action() end";
      #   options.desc = "Code action";
      # }
      # {
      #   key = "gd";
      #   action = helpers.mkRaw "function() vim.lsp.buf.definition() end";
      #   options.desc = "Goto definition";
      # }
      # {
      #   key = "gD";
      #   action = helpers.mkRaw "function() vim.lsp.buf.declaration() end";
      #   options.desc = "Goto declaration";
      # }
      # {
      #   key = "gI";
      #   action = helpers.mkRaw "function() vim.lsp.buf.implementation() end";
      #   options.desc = "Goto implementation";
      # }
      # {
      #   key = "<leader>D";
      #   action = helpers.mkRaw "function() vim.lsp.buf.type_definition() end";
      #   options.desc = "Type definition";
      # }
      # {
      #   key = "gr";
      #   action = helpers.mkRaw "function() require('telescope.builtin').lsp_references() end";
      #   options.desc = "Goto references";
      # }
      # {
      #   key = "<leader>s";
      #   action = helpers.mkRaw "function() require('telescope.builtin').lsp_document_symbols() end";
      #   options.desc = "Document symbols";
      # }
      # {
      #   key = "<leader>S";
      #   action = helpers.mkRaw "function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end";
      #   options.desc = "Dynamic workspace symbols";
      # }
      # {
      #   key = "K";
      #   action = helpers.mkRaw "function() vim.lsp.buf.hover() end";
      #   options.desc = "Hover";
      # }
      # {
      #   key = "<leader>f";
      #   action = helpers.mkRaw "function() vim.lsp.buf.format() end";
      #   options.desc = "Format";
      # }
      # {
      #   key = "<leader>h";
      #   action = helpers.mkRaw "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
      #   options.desc = "Toggle inlay hints";
      # }
      # {
      #   key = "<leader>[d";
      #   action = helpers.mkRaw "function() vim.diagnostic.goto_prev() end";
      #   options.desc = "Goto previous diagnostic";
      # }
      # {
      #   key = "<leader>]d";
      #   action = helpers.mkRaw "function() vim.diagnostic.goto_next() end";
      #   options.desc = "Goto next diagnostic";
      # }

      # Luasnip
      # {
      #   mode = [ "i" "s" ];
      #   key = "<c-k>";
      #   action = helpers.mkRaw ''
      #     function()
      #       local ls = require("luasnip")
      #       if ls.expand_or_jumpable() then
      #         ls.expand_or_jump()
      #       end
      #     end
      #   '';
      #   options.desc = "Expand or jump";
      # }
      # {
      #   mode = [ "i" "s" ];
      #   key = "<c-j>";
      #   action = helpers.mkRaw ''
      #     function()
      #       local ls = require("luasnip")
      #       if ls.jumpable(-1) then
      #         ls.jump(-1)
      #       end
      #     end
      #   '';
      #   options.desc = "Jump back";
      # }

      # Trouble
      {
        mode = "n";
        key = "<leader>xx";
        action = "<cmd>Trouble diagnostic toggle<cr>";
        options.desc = "Diagnostics (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>xX";
        action = "<cmd>Trouble diagnostic toggle filter.buf=0<cr>";
        options.desc = "Buffer Diagnostics (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>cs";
        action = "<cmd>Trouble symbols toggle focus=false<cr>";
        options.desc = "Symbols (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>cl";
        action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
        options.desc = "LSP Definitions / references / ... (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>xL";
        action = "<cmd>Trouble toclist toggle<cr>";
        options.desc = "Location List (Trouble)";
      }
      {
        mode = "n";
        key = "<leader>xQ";
        action = "<cmd>Trouble qflist toggle<cr>";
        options.desc = "Quickfix List (Trouble)";
      }

      # Utils
      # {
      #   key = "<cr>";
      #   action = helpers.mkRaw ''
      #     function()
      #       if vim.opt.hlsearch:get() then
      #         vim.cmd.nohl()
      #         return ""
      #       else
      #         return "<CR>"
      #       end
      #     end
      #   '';
      #   options.desc = "Enter";
      # }

      # Harpoon
      # {
      #   key = "<leader>hg";
      #   action = helpers.mkRaw "function() require('harpoon.mark').add_file() end";
      #   options.desc = "Mark file";
      # }
      # {
      #   key = "<leader>th";
      #   action = helpers.mkRaw "function() require('harpoon.ui').toggle_quick_menu() end";
      #   options.desc = "Harpoon";
      # }
    ]; 
    # ++
    # (
    #   let
    #     keys = [ "a" "s" "d" "f" ];
    #   in
    #   (lib.lists.imap1
    #     (
    #       i: key:
    #         {
    #           key = "<leader>h${key}";
    #           action = helpers.mkRaw "function() require('harpoon.ui').nav_file(${builtins.toString i}) end";
    #           options.desc = "Goto mark ${builtins.toString i}";
    #         }
    #     )
    #     keys)
    # );
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
    extraConfigLua = ''
      vim.cmd([[highlight StatusLine guifg=#${config.colorScheme.palette.base03} guibg=#${config.colorScheme.palette.base01}]])
      vim.cmd([[highlight StatusLineNC guifg=#${config.colorScheme.palette.base03} guibg=#${config.colorScheme.palette.base01}]])

      local function git_branch()
        local branch = vim.fn.system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
        if string.len(branch) > 0 then
          return branch
        else
          return ":"
        end
      end

      local function statusline()
        local set_color_1 = "%#StatusLine#"
        local branch = git_branch()
        local set_color_2 = "%#StatusLineNC#"
        local file_name = " %f"
        local modified = "%m"
        local align_right = "%="
        local fileencoding = " %{&fileencoding?&fileencoding:&encoding}"
        local fileformat = " [%{&fileformat}]"
        local filetype = " %y"
        local percentage = " %p%%"
        local linecol = " %l:%c"

        return string.format(
          "%s%s%s%s%s%s%s%s%s%s%s",
          set_color_1,
          branch,
          set_color_2,
          file_name,
          modified,
          align_right,
          filetype,
          fileencoding,
          fileformat,
          percentage,
          linecol
        )
      end

      vim.opt.statusline = statusline()
    '';
    # files = {
    #   "ftplugin/nix.lua" = {
    #     options = {};
    #   };
    # };
  };
  home.file.".config/nvim/ftplugin".source = ./ftplugin;
}

