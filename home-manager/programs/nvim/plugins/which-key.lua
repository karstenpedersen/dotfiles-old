local wk = require("which-key")

wk.register({
    ["<leader>t"] = {
        name = "+Telescope",
        f = { "<cmd>Telescope find_files<cr>", "Find files" },
        F = { "<cmd>Telescope file_browser<cr>", "File browser" },
        g = { "<cmd>Telescope git_files<cr>", "Git files" },
        G = { "<cmd>Telescope live_grep<cr>", "Live grep" },
        h = { "<cmd>Telescope harpoon marks<cr>", "Harpoon marks" }
    },
    ["<leader>h"] = {
        name = "+Harpoon",
        t = { function() require("harpoon.mark").add_file() end, "Harpoon file" },
        a = { function() require("harpoon.ui").nav_file(1) end, "Goto mark 1" },
        s = { function() require("harpoon.ui").nav_file(2) end, "Goto mark 2" },
        d = { function() require("harpoon.ui").nav_file(3) end, "Goto mark 3" },
        f = { function() require("harpoon.ui").nav_file(4) end, "Goto mark 4" }
    },
    ["<leader>r"] = { function() vim.lsp.buf.rename() end, "Rename" },
    ["<leader>a"] = { function() vim.lsp.buf.code_action() end, "Code action" },
    ["gd"] = { function() vim.lsp.buf.definition() end, "Goto definition" },
    ["gD"] = { function() vim.lsp.buf.declaration() end, "Goto declaration" },
    ["gI"] = { function() vim.lsp.buf.implementation() end, "Goto implementation" },
    ["<leader>D"] = { function() vim.lsp.buf.type_definition() end, "Type definition" },
    ["gr"] = { function() require("telescope.builtin").lsp_references() end, "Goto references" },
    ["<leader>s"] = { function() require("telescope.builtin").lsp_document_symbols() end, "Document symbols" },
    ["<leader>S"] = { function() require("telescope.builtin").lsp_dynamic_workspace_symbols() end, "Dynamic workspace symbols" },
    ["K"] = { function() vim.lsp.buf.hover() end, "Hover" },
    ["<leader>f"] = { function() vim.lsp.buf.format() end, "Format" }
})

-- bufmap('<leader>r', vim.lsp.buf.rename)
-- bufmap('<leader>a', vim.lsp.buf.code_action)
-- bufmap('gd', vim.lsp.buf.definition)
-- bufmap('gD', vim.lsp.buf.declaration)
-- bufmap('gI', vim.lsp.buf.implementation)
-- bufmap('<leader>D', vim.lsp.buf.type_definition)
-- bufmap('gr', require('telescope.builtin').lsp_references)
-- bufmap('<leader>s', require('telescope.builtin').lsp_document_symbols)
-- bufmap('<leader>S', require('telescope.builtin').lsp_dynamic_workspace_symbols)
-- bufmap('K', vim.lsp.buf.hover)
-- bufmap('<leader>f', function()
--  vim.lsp.buf.format { async = true }
-- end)
