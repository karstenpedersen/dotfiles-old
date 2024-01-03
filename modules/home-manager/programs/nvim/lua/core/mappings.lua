local function map(mode, lhs, rhs, opts)
  local options = { noremap=true, silent=true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- Center screen when jumping
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Disable arrow keys
map('', '<Up>', '<Nop>')
map('', '<Left>', '<Nop>')
map('', '<Down>', '<Nop>')
map('', '<Right>', '<Nop>')

-- Line movement for softwrapped lines
map('', 'j', "(v:count == 0 ? 'gj' : 'j')", { expr=true })
map('', 'k', "(v:count == 0 ? 'gk' : 'k')", { expr=true })

