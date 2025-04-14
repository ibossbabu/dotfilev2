return {
  {
    'nvimdev/guard.nvim',
    event = "BufReadPre",
    dependencies = { 'nvimdev/guard-collection' },
    config = function()
      local ft = require("guard.filetype")
      ft("c,cpp"):fmt("clang-format")
    end,
  },
  vim.keymap.set('n', '<leader>nf', vim.lsp.buf.format, {})
}
