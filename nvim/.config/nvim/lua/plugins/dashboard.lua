return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      shortcut_type = 'number',
      config = {
        header = {
          "",
          "  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ",
          "  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ",
          " ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ",
          " ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ",
          " ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ",
          " ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ",
          " ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ",
          "    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ",
          "          ░    ░  ░    ░ ░        ░   ░         ░    ",
          "                                 ░                   ",
        },
        center = {
          {
            icon = "  ",
            desc = "New File",
            action = "enew",
            key = "e",
          },
          {
            icon = "  ",
            desc = "Folder                                    ",
            action = "Oil",
            key = "f",
          },
          {
            icon = "󰈞  ",
            desc = "Search  File                              ",
            action = "FzfLua files ",
            key = "s",
          },
          {
            icon = "󰈢  ",
            desc = "Recently Opened Files                   ",
            action = "FzfLua oldfiles",
            key = "r",
          },
          {
            icon = "  ",
            desc = "Open Nvim config                        ",
            action = 'FzfLua files cwd=' .. vim.fn.stdpath('config'),
            key = "o",
          },
          {
            icon = "󰒲  ",
            desc = "Lazy                        ",
            action = "Lazy",
            key = "l",
          },
          {
            icon = "󰗼  ",
            desc = "Quit Nvim                               ",
            action = "qa",
            key = "q",
          },
        }
      } }
  end,
  dependencies = { { "echasnovski/mini.icons" } }
}
