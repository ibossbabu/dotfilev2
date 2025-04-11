return {
  {
    'saghen/blink.cmp',
    lazy = false,
    version = '*',
    dependencies = 'rafamadriz/friendly-snippets',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    ---@diagnostic disable: missing-fields
    opts = {
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      keymap = {
        preset = 'default',
        ["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
      },

      completion = {
        accept = { auto_brackets = { enabled = true }
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },
    },
    opt_extend = { "sources.default" }
  },
}
