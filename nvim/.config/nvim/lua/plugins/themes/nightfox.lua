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
      },
      options = {
        transparent = false, -- Ensure transparency is disabled
      },
    })
  end
}
