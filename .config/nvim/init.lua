-- init.lua

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.timeoutlen = 100
vim.opt.compatible = false

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.showbreak = '>>'
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.showmatch = true
vim.opt.hlsearch = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.fillchars = { vert = '|' }

vim.api.nvim_set_keymap('i', 'kj', '<esc>', { noremap = true })
vim.api.nvim_set_keymap('n', 'kj', '<esc>', { noremap = true })
