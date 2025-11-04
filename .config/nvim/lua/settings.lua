-- settings.lua

vim.opt.termguicolors = true
vim.opt.laststatus = 2
vim.opt.showmode = true

vim.opt.spell = true

--vim.opt.clipboard:append("unnamedplus")
vim.g.clipboard = {
    name = "xclip-wsl",
    copy = {
        ["+"] = "xclip -i -selection clipboard"
    },
    paste = {
        ["+"] = "xclip -o -selection clipboard"
    },
    cache_enabled = 0,
}

vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.compatible = false
vim.opt.timeoutlen = 500

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.autoindent = true
vim.opt.breakindent = true
vim.opt.showbreak = '>>'

vim.opt.showmatch = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

--vim.opt.foldmethod = "indent"

vim.opt.backup = false
vim.opt.writebackup = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.fillchars = { vert = '|' }

vim.opt.path:append('**')
vim.opt.wildmenu = true
