{ config, pkgs, inputs, lib, ... }:

{
  # Add plugins from github
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

      # Indentation
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      shiftround = true;
      expandtab = true;
      smartindent = true;
      autoindent = true;
      scrolloff = 8;
      wrap = false;

      # Search
      hlsearch = true;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
    };
    # colorschemes.base16 = {
    #   enable = true;
    #   colorscheme = builtins.mapAttrs (name: value: "#${value}") config.colorScheme.colors;
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
        options.desc = "Projects";
      }
      {
        key = "[c";
        action = "function() require('treesitter-context').go_to_context(vim.v.count1) end";
        options.desc = "Goto implementation";
        lua = true;
      }

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
      {
        key = "<leader>tp";
        action = "<cmd>Telescope projects<cr>";
        options.desc = "Projects";
      }

      # LSP
      {
        key = "<leader>r";
        action = "function() vim.lsp.buf.rename() end";
        options.desc = "Rename";
        lua = true;
      }
      {
        key = "<leader>a";
        action = "function() vim.lsp.buf.code_action() end";
        options.desc = "Code action";
        lua = true;
      }
      {
        key = "gd";
        action = "function() vim.lsp.buf.definition() end";
        options.desc = "Goto definition";
        lua = true;
      }
      {
        key = "gD";
        action = "function() vim.lsp.buf.declaration() end";
        options.desc = "Goto declaration";
        lua = true;
      }
      {
        key = "gI";
        action = "function() vim.lsp.buf.implementation() end";
        options.desc = "Goto implementation";
        lua = true;
      }
      {
        key = "<leader>D";
        action = "function() vim.lsp.buf.type_definition() end";
        options.desc = "Type definition";
        lua = true;
      }
      {
        key = "gr";
        action = "function() require('telescope.builtin').lsp_references() end";
        options.desc = "Goto references";
        lua = true;
      }
      {
        key = "<leader>s";
        action = "function() require('telescope.builtin').lsp_document_symbols() end";
        options.desc = "Document symbols";
        lua = true;
      }
      {
        key = "<leader>S";
        action = "function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end";
        options.desc = "Dynamic workspace symbols";
        lua = true;
      }
      {
        key = "K";
        action = "function() vim.lsp.buf.hover() end";
        options.desc = "Hover";
        lua = true;
      }
      {
        key = "<leader>f";
        action = "function() vim.lsp.buf.format() end";
        options.desc = "Format";
        lua = true;
      }

      # Harpoon
      {
        key = "<leader>ht";
        action = "function() require('harpoon.mark').add_file() end";
        options.desc = "Mark file";
        lua = true;
      }
      {
        key = "<leader>th";
        action = "function() require('harpoon.ui').toggle_quick_menu() end";
        options.desc = "Harpoon";
        lua = true;
      }
    ] ++
    (
      let
        keys = [ "a" "s" "d" "f" ];
      in
      (lib.lists.imap1
        (
          i: key:
            {
              key = "<leader>h${key}";
              action = "function() require('harpoon.ui').nav_file(${builtins.toString i}) end";
              options.desc = "Goto mark ${builtins.toString i}";
              lua = true;
            }
        )
        keys)
    );
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
          emmet_ls.enable = true;
          eslint.enable = true;
          svelte.enable = true;
          astro.enable = true;
          tailwindcss.enable = true;
          texlab.enable = true;
          rnix-lsp.enable = true;
          hls.enable = true;
          lua-ls.enable = true;
          gopls.enable = true;
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
        # sources = [
        #   { name = "nvim_lsp"; }
        #   { name = "path"; }
        #   { name = "buffer"; }
        #   { name = "luasnip"; }
        # ];
      };
      cmp-buffer.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp_luasnip.enable = true;
      cmp-path.enable = true;
      telescope = {
        enable = true;
      };
      oil = {
        enable = true;
        settings.delete_to_trash = true;
      };
      treesitter.enable = true;
      treesitter-context = {
        enable = true;
        maxLines = 5;
      };
      treesitter-textobjects = {
        enable = true;
      };
      luasnip.enable = true;
      harpoon.enable = true;
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
        };
      };
      # ts-autotag.enable = true;
      surround.enable = true;
      # nvim-autopairs.enable = true;
      comment.enable = true;
      project-nvim.enable = true;
      which-key.enable = true;
      todo-comments.enable = true;

      # Writing
      vimtex = {
        enable = true;
        settings = {
          view_method = "zathura";
          compiler_method = "tectonic";
          compiler_tectonic.out_dir = "./build/";
        };
      };
      goyo = {
        enable = true;
        settings = {
          linenr = true;
          height = 100;
        };
      };
      markdown-preview.enable = true;

      # Visual
      nvim-colorizer = {
        enable = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      own-deadcolumn-nvim
    ];
    extraConfigLua = ''
      vim.cmd([[highlight StatusLine guifg=#${config.colorScheme.colors.base03} guibg=#${config.colorScheme.colors.base01}]])
      vim.cmd([[highlight StatusLineNC guifg=#${config.colorScheme.colors.base03} guibg=#${config.colorScheme.colors.base01}]])

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
          "%s %s %s%s%s%s%s%s%s%s%s",
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
  };
  home.file.".config/nvim/ftplugin".source = ../nvim/ftplugin;
}

