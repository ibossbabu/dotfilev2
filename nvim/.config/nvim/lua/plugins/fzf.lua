return {
  'ibhagwan/fzf-lua',
  event = "VeryLazy",
  dependencies = { 'echasnovski/mini.icons' },
  keys = {
    { "<leader>sc",  function() require("fzf-lua").commands() end,        desc = "search commands" },
    { "<leader>sf",  function() require("fzf-lua").files() end,           desc = "search files" },
    { "<leader>sh",  function() require("fzf-lua").highlights() end,      desc = "search highlights" },
    { "<leader>sM",  function() require("fzf-lua").marks() end,           desc = "search marks" },
    { "<leader>sk",  function() require("fzf-lua").keymaps() end,         desc = "search keymaps" },
    { "<leader>sg",  function() require("fzf-lua").live_grep() end,       desc = "search grep" },
    { "<leader>gf", function() require("fzf-lua").git_files() end,       desc = "search git file names" },
    { "<leader>gb", function() require("fzf-lua").git_branches() end,    desc = "search git branches" },
    { "<leader>gc", function() require("fzf-lua").git_commits() end,     desc = "search git commits" },
    { "<leader>gC", function() require("fzf-lua").git_bcommits() end,    desc = "search git buffer commits" },
    { "<leader>sr",  function() require("fzf-lua").resume() end,          desc = "resume fzf" },
    { "<leader>so",  function() require("fzf-lua").oldfiles() end,           desc = "search oldfiles" },
    { "<leader>sb",  function() require("fzf-lua").buffers() end,           desc = "find existing buffers" },
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

