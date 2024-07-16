{ lib, ... }:

let
  helpers.mkRaw = r: { __raw = r; };
in
{
  programs.nixvim.keymaps = [
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
    {
      key = "[c";
      action = helpers.mkRaw "function() require('treesitter-context').go_to_context(vim.v.count1) end";
      options.desc = "Goto implementation";
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
    {
      key = "<c-t>";
      action = helpers.mkRaw ''
        function()
          require('telescope.builtin').live_grep({
            default_text="TODO",
            initial_mode="normal"
          })
        end
      '';
      options.desc = "Live grep todos";
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
    {
      key = "<leader>r";
      action = helpers.mkRaw "function() vim.lsp.buf.rename() end";
      options.desc = "Rename";
    }
    {
      key = "<leader>a";
      action = helpers.mkRaw "function() vim.lsp.buf.code_action() end";
      options.desc = "Code action";
    }
    {
      key = "gd";
      action = helpers.mkRaw "function() vim.lsp.buf.definition() end";
      options.desc = "Goto definition";
    }
    {
      key = "gD";
      action = helpers.mkRaw "function() vim.lsp.buf.declaration() end";
      options.desc = "Goto declaration";
    }
    {
      key = "gI";
      action = helpers.mkRaw "function() vim.lsp.buf.implementation() end";
      options.desc = "Goto implementation";
    }
    {
      key = "<leader>D";
      action = helpers.mkRaw "function() vim.lsp.buf.type_definition() end";
      options.desc = "Type definition";
    }
    {
      key = "gr";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_references() end";
      options.desc = "Goto references";
    }
    {
      key = "<leader>s";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_document_symbols() end";
      options.desc = "Document symbols";
    }
    {
      key = "<leader>S";
      action = helpers.mkRaw "function() require('telescope.builtin').lsp_dynamic_workspace_symbols() end";
      options.desc = "Dynamic workspace symbols";
    }
    {
      key = "K";
      action = helpers.mkRaw "function() vim.lsp.buf.hover() end";
      options.desc = "Hover";
    }
    {
      key = "<leader>f";
      action = helpers.mkRaw "function() vim.lsp.buf.format() end";
      options.desc = "Format";
    }
    {
      key = "<leader>h";
      action = helpers.mkRaw "function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end";
      options.desc = "Toggle inlay hints";
    }
    {
      key = "<leader>[d";
      action = helpers.mkRaw "function() vim.diagnostic.goto_prev() end";
      options.desc = "Goto previous diagnostic";
    }
    {
      key = "<leader>]d";
      action = helpers.mkRaw "function() vim.diagnostic.goto_next() end";
      options.desc = "Goto next diagnostic";
    }

    # Luasnip
    {
      mode = [ "i" "s" ];
      key = "<c-k>";
      action = helpers.mkRaw ''
        function()
          local ls = require("luasnip")
          if ls.expand_or_jumpable() then
            ls.expand_or_jump()
          end
        end
      '';
      options.desc = "Expand or jump";
    }
    {
      mode = [ "i" "s" ];
      key = "<c-j>";
      action = helpers.mkRaw ''
        function()
          local ls = require("luasnip")
          if ls.jumpable(-1) then
            ls.jump(-1)
          end
        end
      '';
      options.desc = "Jump back";
    }

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
    {
      key = "<cr>";
      action = helpers.mkRaw ''
        function()
          if vim.opt.hlsearch:get() then
            vim.cmd.nohl()
            return ""
          else
            return "<CR>"
          end
        end
      '';
      options.desc = "Enter";
    }

    # Harpoon
    {
      key = "<leader>hg";
      action = helpers.mkRaw "function() require('harpoon.mark').add_file() end";
      options.desc = "Mark file";
    }
    {
      key = "<leader>th";
      action = helpers.mkRaw "function() require('harpoon.ui').toggle_quick_menu() end";
      options.desc = "Harpoon";
    }
  ] ++ (
    let
      keys = [ "a" "s" "d" "f" ];
    in
    (lib.lists.imap1
      (i: key:
        {
          key = "<leader>h${key}";
          action = helpers.mkRaw "function() require('harpoon.ui').nav_file(${builtins.toString i}) end";
          options.desc = "Goto mark ${builtins.toString i}";
        }
      )
      keys)
  );
}
