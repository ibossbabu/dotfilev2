return {
  'ibhagwan/fzf-lua',
  event = "VeryLazy",
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    { "<leader>sc", function() require("fzf-lua").commands() end,                                desc = "search commands" },
    { "<leader>sf", function() require("fzf-lua").files() end,                                   desc = "search files" },
    { "<leader>sk", function() require("fzf-lua").keymaps() end,                                 desc = "search keymaps" },
    { "<leader>sg", function() require("fzf-lua").lgrep_curbuf() end,                            desc = "search grep current buff" },
    { "<leader>sr", function() require("fzf-lua").resume() end,                                  desc = "resume fzf" },
    { "<leader>so", function() require("fzf-lua").oldfiles() end,                                desc = "search oldfiles" },
    { '<leader>sn', function() require("fzf-lua").files({ cwd = vim.fn.stdpath('config') }) end, desc = "nvim config" },

  },
  config = function()
    local fzf = require('fzf-lua')
    fzf.setup({
      keymap = {
        fzf = {
          ['CTRL-Q'] = 'select-all+accept',
        },
      },
    })
  end,
}
