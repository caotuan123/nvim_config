vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",{desc = 'Move the selected lines down by one line and re-indent them'})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",{desc = 'Move the selected lines up by one line and re-indent them'})

vim.keymap.set("n", "J", "mzJ`z", {desc= 'Join lines without moving the cursor'})
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc='Half-page down and keep cursor centered'})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc='Half-page up and keep cursor centered'})
vim.keymap.set("n", "n", "nzzzv", {desc='Jump to next search result, center it, and open folds'})
vim.keymap.set("n", "N", "Nzzzv", {desc='Jump to previous search result, center it, and open folds'})

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]], {desc='Paste over selection without overwriting yank register'})
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], {desc='Yank to system clipboard'})
vim.keymap.set("n", "<leader>P", [["+p]], {desc='Paste from system clipboard'})
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d", {desc='Delete without copying to registers'})
vim.keymap.set("i", "<C-c>", "<Esc>", {desc='Exit insert mode'})
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", {desc='Go to next location list item(can be LSP, grep, plugins,...'})
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", {desc='Go to previous location list item'})
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], {desc='Substitute word under cursor'})
--navigate in insert mode
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
--navigate in tmux
vim.keymap.set({"n","i"}, "<M-H>", "<cmd> TmuxNavigateLeft<CR>")
vim.keymap.set({"n","i"}, "<M-L>", "<cmd> TmuxNavigateRight<CR>")
vim.keymap.set({"n","i"}, "<M-J>", "<cmd> TmuxNavigateDown<CR>")
vim.keymap.set({"n","i"}, "<M-K>", "<cmd> TmuxNavigateUp<CR>")
--telescope keymap
local telescope = require('telescope.builtin')
local telescope_extension = require("telescope").extensions
vim.keymap.set('n', '<leader>ff', telescope.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fu', telescope.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', telescope.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fb', function()
	telescope_extension.file_browser.file_browser({
		path = "%:p:h",
		select_buffer = true,
	})
end, { desc = 'Telescope file browser' })
vim.keymap.set('n', '<leader>fl', telescope.lsp_references, { desc = 'Telescope lsp reference' })
vim.keymap.set('n', '<leader>fc', telescope.git_commits, { desc = 'Telescope git commit' })
vim.keymap.set('n', '<leader>fr', telescope.git_branches, { desc = 'Telescope git branches'})
-- conform
vim.keymap.set("n", "<leader>F", function()
  require("conform").format({ async = true })
end)
-- 
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostic" })

-- Lsp
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
vim.keymap.set("n", "<leader>ld", vim.lsp.buf.declaration, { desc = "LSP go to declaration" })

-- git diff

vim.keymap.set("n", "<leader>gd", function()
  local name = vim.api.nvim_buf_get_name(0)

  if name:match("%.git//") or name:match("fugitive:") or vim.wo.diff then
    vim.cmd("diffoff!")
    vim.cmd("wincmd p")
    vim.cmd("only")
  else
    vim.cmd("Gdiffsplit")
  end
end, { desc = "Toggle Fugitive diff" })

