-- autocmds.lua

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "*",
    callback = function()
        if vim.fn.empty(vim.fn.expand("%")) == 0 then
            vim.cmd("silent! mkview")
        end
    end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*",
    callback = function()
        if vim.fn.empty(vim.fn.expand("%")) == 0 and vim.fn.filereadable(vim.fn.expand("%:p")) == 1 then
            vim.cmd("silent! loadview")
        end
    end,
})

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 250 })
    end
})

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    command = '%s/\\s\\+$//e',
})

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove("r")
        vim.opt.formatoptions:remove("o")
    end,
})

