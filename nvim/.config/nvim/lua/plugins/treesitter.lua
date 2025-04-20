return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = 'BufReadPost',
    opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "c",
        "bash",
        "vim",
        "lua",
        "json",
        "css",
        "make",
        "jsonc",
        "markdown",
        "markdown_inline",
        "go",
      },
    },
  },
}
