return {
  {
    'echasnovski/mini.nvim',
    version = '*',
    config = function()
      local hi = require("mini.hipatterns")
      -- Setup for mini.indentscope
      require('mini.indentscope').setup({
        draw = { animation = function() return 0 end },
        symbol = "▏",
        options = { try_as_border = true },
      })
      require('mini.icons').setup()
      require('mini.ai').setup()
      require('mini.git').setup()
      require('mini.statusline').setup()
      require('mini.splitjoin').setup({
        mappings = { toggle = 'gS', split = '', join = '', },
      })
      require('mini.hipatterns').setup({
        tailwind = {
          enabled = true,
          ft = { "css", "html", "javascript", "typescript" },
          style = "full",
        },
        highlighters = {
          hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
          shorthand = {
            pattern = "()#%x%x%x()%f[^%x%w]",
            group = function(_, _, data)
              ---@type string
              local match = data.full_match
              local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
              local hex_color = "#" .. r .. r .. g .. g .. b .. b
              return MiniHipatterns.compute_hex_color_group(hex_color, "bg")
            end,
            extmark_opts = { priority = 2000 },
          },
        },
      })
    end,
    init = function()
      -- Autocommand to disable miniindentscope on certain filetypes
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "dashboard", "fzf", "help", "lazy", "mason", "notify", "markdown", },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
}
