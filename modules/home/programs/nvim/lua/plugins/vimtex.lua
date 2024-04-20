vim.api.nvim_create_autocmd({ "FileType" }, {
    group = vim.api.nvim_create_augroup("lazynvim_vimtex_conceal", { clear = true}),
    pattern = {
        "bib",
        "tex",
    },
    callback = function ()
        vim.wo.conceallevel = 2
    end
})

vim.g.vimtex_view_method = 'zathura'
vim.g.vimtex_compiler_method = 'tectonic'
vim.g.vimtex_mappings_disabled = {
    ["n"] = { "K" }
}
vim.g.vimtex_quickfix_method = vim.fn.executable("pplatex") == 1 and "pplatex" or "latexlog"
vim.g.vimtex_compiler_tectonic = {
    out_dir = './out/',
}
