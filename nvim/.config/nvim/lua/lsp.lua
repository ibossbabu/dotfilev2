-- LSP Setup
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup("UserLspConfig", {}),
  callback = function(args)
    -- Lsp-native auto-formatting on save
    local c = vim.lsp.get_client_by_id(args.data.client_id)
    local opts = { buffer = args.buf, silent = true }
    local supported_filetypes = { "lua", "go", "c", "cpp" }

    if not c:supports_method('textDocument/willSaveWaitUntil')
        and c:supports_method('textDocument/formatting')
        and vim.tbl_contains(supported_filetypes, vim.bo.filetype) then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup("UserLspConfig", { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
        end,
      })
    end

    -- Standard LSP Keymaps
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Reference" }))
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP Goto Definition" }))
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP Hover" }))
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.setloclist() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP Show Diagnostics" }))
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP Code Action" }))
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP References" }))
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP Rename" }))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end,
      vim.tbl_deep_extend("force", opts, { desc = "LSP Signature Help" }))
  end,
})

-- Function to jump with virtual line diagnostics
---@param jumpCount number
local function jumpWithVirtLineDiags(jumpCount)
  pcall(vim.api.nvim_del_augroup_by_name, "jumpWithVirtLineDiags") -- prevent autocmd for repeated jumps

  vim.diagnostic.jump { count = jumpCount }

  local initialVirtTextConf = vim.diagnostic.config().virtual_text
  vim.diagnostic.config { virtual_text = false, virtual_lines = { current_line = true }, }

  vim.defer_fn(function() -- deferred to not trigger by jump itself
    vim.api.nvim_create_autocmd("CursorMoved", {
      desc = "User(once): Reset diagnostics virtual lines",
      once = true,
      group = vim.api.nvim_create_augroup("jumpWithVirtLineDiags", {}),
      callback = function()
        vim.diagnostic.config { virtual_lines = false, virtual_text = initialVirtTextConf }
      end,
    })
  end, 1)
end
--    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end,
--      vim.tbl_deep_extend("force", opts, { desc = "Next Diagnostic" }))
--    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end,
--      vim.tbl_deep_extend("force", opts, { desc = "Previous Diagnostic" }))
vim.keymap.set("n", "]d", function() jumpWithVirtLineDiags(1) end, { desc = "󰒕 Next diagnostic" })
vim.keymap.set("n", "[d", function() jumpWithVirtLineDiags(-1) end, { desc = "󰒕 Prev diagnostic" })
