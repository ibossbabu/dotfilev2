-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins/themes" },
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
--vim.cmd("colorscheme boo")
--vim.cmd("colorscheme duskfox")
vim.cmd('colorscheme github_dark_high_contrast')
