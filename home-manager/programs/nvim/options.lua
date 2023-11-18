-- Leader
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.wildmenu = true
vim.opt.showmatch = true
vim.opt.cursorline = true
vim.showcmd = true

-- Indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Wrapping
vim.opt.wrap = false
vim.opt.colorcolumn = '80'

-- Colors
vim.opt.termguicolors = true
vim.api.nvim_set_option('background', 'dark')

-- Files
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undofile = true

-- Searching
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- vim.o.path = vim.o.path .. '**'

-- Disable mouse
vim.opt.mouse = ''
