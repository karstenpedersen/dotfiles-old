
local wk = require("whichkey")

let harpoon = require("harpoon.mark")

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
        t = { { function() require("harpoon.mark").add_file() end }, "Harpoon file" },
        a = { { function() require("harpoon.ui").nav_file(1) end }, "Goto mark 1" },
        s = { { function() require("harpoon.ui").nav_file(2) end }, "Goto mark 1" },
        d = { { function() require("harpoon.ui").nav_file(3) end }, "Goto mark 1" },
        f = { { function() require("harpoon.ui").nav_file(4) end }, "Goto mark 1" },
    },
})
