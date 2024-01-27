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
    options = {
      number = true;
      relativenumber = true;
      colorcolumn = "80";
      wildmenu = true;
      showmatch = true;
      cursorline = true;
      showcmd = true;

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
    keymaps = [
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
        action = "function() require('harpoon.mark').add_file() end";
        options.desc = "Harpoon";
        lua = true;
      }
    ] ++
      (let
        keys = ["a" "s" "d" "f"];
      in
      (lib.lists.imap1
        (
          i: key:
          {
            key = "<leader>h${key}";
            action = "function() require('harpoon.ui').add_file(${builtins.toString i}) end";
            options.desc = "Goto mark ${builtins.toString i}";
            lua = true;
          }
        )
      keys));
    plugins = {
      lualine = {
         enable = true;
         theme = "base16";
      };
      lsp = {
        enable = true;
        servers = {
          tsserver.enable = true;
          lua-ls.enable = true;
          rust-analyzer.enable = true;
          nixd.enable = true;
        };
      };
      nvim-cmp = {
        enable = true;
        autoEnableSources = true;
        sources = [
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          { name = "luasnip"; }
        ];
      };
      telescope = {
        enable = true;
        extensions = {
          project-nvim.enable = true;
        };
      };
      oil = {
        enable = true;
      };
      treesitter = {
        enable = true;
      };
      luasnip = {
        enable = true;
      };
      harpoon = {
        enable = true;
      };
      gitsigns = {
	      enable = true;
	      currentLineBlame = true;
      };
      surround = {
	      enable = true;
      };
      nvim-autopairs = {
        enable = true;
      };
      ts-autotag = {
        enable = true;
      };
      comment-nvim = {
	      enable = true;
      };
      project-nvim = {
        enable = true;
      };
      which-key.enable = true;
      # todo-comments = {
      #   enable = true;
      #   # colors = with config.colorScheme.colors; {
      #   #   error = [ "DiagnosticError" "ErrorMsg" "#${base08}" ];
      #   #   warning = [ "DiagnosticWarn" "WarningMsg" "#${base09}" ];
      #   #   info = [ "DiagnosticInfo" "#${base0D}" ];
      #   #   hint = [ "DiagnosticHint" "#${base0B}" ];
      #   #   default = [ "Identifier" "#${base0E}" ];
      #   #   test = [ "Identifier" "#${base0C}" ];
      #   # };
      # };

      # Writing
      vimtex = {
	      enable = true;
      };
      goyo = {
        enable = true;
        showLineNumbers = true;
      };
      # obsidian = {
      #   enable = true;
      #   dir = "~/Nextcloud/vault";
      #   notesSubdir = "000-notes";
      #   noteIdFunc = ''
      #     function(title)
      #       local suffix = ""
      #       if title ~= nil then
      #         suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      #       else
      #         -- If title is nil, just add 4 random uppercase letters to the suffix.
      #         for _ = 1, 4 do
      #           suffix = suffix .. string.char(math.random(65, 90))
      #         end
      #       end
      #       return suffix
      #     end
      #   '';
      #   noteFrontmatterFunc = ''
      #     function(note)
      #       local out = { tags = note.tags }
      #
      #       if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
      #         for k, v in pairs(note.metadata) do
      #           out[k] = v
      #         end
      #       end
      #       return out
      #     end
      #   '';
      # };

      # Visual
      nvim-colorizer = {
	      enable = true;
      };
      indent-blankline = {
      	enable = true;
      };
      illuminate = {
        enable = true;
      };
    };
    extraPlugins = with pkgs.vimPlugins; [
      own-deadcolumn-nvim
    ];
    colorschemes.base16 = {
      enable = true;
      customColorScheme = builtins.mapAttrs (name: value: "#${value}") config.colorScheme.colors;
    };
  };
}
