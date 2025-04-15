vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<ESC>", {})

vim.keymap.set("n", "<leader>l", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set('n', '<C-w>s', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>v', ':split<CR>', { noremap = true, silent = true })
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "x", '"_x', opts)
-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

--TERM
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>', { noremap = true, silent = true })

function OpenTerm()
  vim.cmd('10split')
  vim.cmd('lcd %:p:h')
  vim.cmd('term')
  vim.api.nvim_feedkeys('i', 'n', false)
end

vim.api.nvim_set_keymap('n', '<Leader>th', ':lua OpenTerm()<CR>', { noremap = true, silent = true })
