-- highlights.lua

local M = {}

function M.default_apply()
    vim.api.nvim_set_hl(0, "MsgArea", { fg = "#c0c0c0" })
    vim.api.nvim_set_hl(0, "StatusLine", { fg = "#c0c0c0", bg = "#1e1e1e", bold = true })
    vim.api.nvim_set_hl(0, "StatusLineNC", { fg = "#707070", bg = "#1e1e1e" })
    vim.cmd [[
      hi Normal guibg=none ctermbg=none
      hi LineNr guibg=none ctermbg=none
      hi SignColumn guibg=none ctermbg=none
      hi EndOfBuffer guibg=none ctermbg=none
      hi WinSeparator guibg=none ctermbg=none
    ]]
end

return M
