return {
  {
    "williamboman/mason.nvim",
    build = function()
      pcall(vim.cmd, "MasonUpdate")
    end,
    dependencies = {
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      require("mason").setup()
      require("mason-tool-installer").setup({
        ensure_installed = {
          "codelldb",
          "clangd",
          "gopls",
          "delve",
          "lua-language-server",
        },
        auto_update = true,
      })
    end,
  },
}
