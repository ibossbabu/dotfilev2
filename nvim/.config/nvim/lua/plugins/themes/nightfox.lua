return {
  "EdenEast/nightfox.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("nightfox").setup({
      palettes = {
        nightfox = {
          bg1 = "#000000", -- Set the main background to black
        },
        duskfox = {
          bg0 = "#000000",  -- Set the main background to black
          bg1 = "#000000",  -- Current line background
          bg2 = "#1d1d2b",  -- Alt backgrounds (floats, statusline, ...)
          bg3 = "#121820",  -- 55% darkened from stock
          sel0 = "#131b24", -- 55% darkened from stocks
        },
      },
      specs = {
        duskfox = {
          inactive = "#090909", -- Slightly lighter than black background
        },
      },
      options = {
        transparent = false, -- Ensure transparency is disabled
      },
    })
  end
}
