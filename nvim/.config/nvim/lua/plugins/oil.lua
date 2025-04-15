return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { "echasnovski/mini.icons", opts = {} },
  lazy = false,
  config = function()
    local oil = require("oil")
    oil.setup({
      default_file_explorer = true,
      keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
      },
      float = {
        padding = 4,
        max_width = 110,
        max_height = 40,
        border = "rounded",
        get_win_title = nil,
        preview_split = "auto",
        override = function(conf)
          return conf
        end,
      }
    })
    vim.keymap.set("n", "-", "<CMD>OIL<CR>", { desc = "Open parent directory" })
    vim.keymap.set("", "<leader>-", oil.toggle_float, {})
  end,
}
