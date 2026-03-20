vim.g.mapleader = " "
vim.keymap.set("n","<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>P", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>d", "\"_d")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
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
vim.keymap.set('n', '<leader>fb', telescope_extension.file_browser.file_browser, { desc = 'Telescope file browser' })
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
