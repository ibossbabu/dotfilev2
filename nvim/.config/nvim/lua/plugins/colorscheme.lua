return {
  "ramojus/mellifluous.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("mellifluous").setup({
      mellifluous = {
        highlight_overrides = {
          dark = function(highlighter, colors)
            highlighter.set("VISUAL", { bg = "#493a4c" })
          end,
        },
        color_overrides = {
          dark = {
            bg = function(bg)
              return bg:lightened(2)
            end,
            colors = function(colors)
              return {
                main_keywords = "#955ae7",
                functions = "#576ddb",
                strings = "#2a9292",
                constants = "#a06e3b",
                other_keywords = "#be4678",
                operators = "#be4678",
                -- operators = colors.functions:desaturated(10),
                -- color based on Atelier_CaveDark
              }
            end,
          },
        },
      },
    })
    vim.cmd("colorscheme mellifluous")
  end
}
