vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
-- Highlight current line number
vim.api.nvim_set_hl(0, 'LineNr', { fg = '#ffaa00', bold = true })

-- Highlight relative numbers above and below
vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = '#888888' })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = '#888888' })
