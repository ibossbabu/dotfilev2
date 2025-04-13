--vim.wo.number = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
--tabs & indentations
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.backspace = "indent,eol,start"
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.cursorline = true
vim.opt.splitbelow = true

vim.keymap.set('t', 'jk', '<C-\\><C-n>', { noremap = true, silent = true })

function OpenTerm()
  vim.cmd('10split')
  vim.cmd('lcd %:p:h')
  vim.cmd('term')
  vim.api.nvim_feedkeys('i', 'n', false)
end

vim.api.nvim_set_keymap('n', '<Leader>th', ':lua OpenTerm()<CR>', { noremap = true, silent = true })
