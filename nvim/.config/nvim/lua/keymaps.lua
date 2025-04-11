vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.keymap.set("i", "jk", "<ESC>", {})

vim.keymap.set("n", "<leader>l", ":Neotree filesystem reveal left<CR>", {})
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set('n', '<C-w>s', ':vsplit<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-w>v', ':split<CR>', { noremap = true, silent = true })
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "x", '"_x', opts)
-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

local nmap_leader = function(suffix, rhs, desc, opts)
  opts = opts or {}
  opts.desc = desc
  vim.keymap.set("n", "<Leader>" .. suffix, rhs, opts)
end

nmap_leader("bm", "<Cmd>Pick marks scope='global'<CR>", "Global Marks")

-- Marks
-- <localleader> 1..9  creates a new mark (replaces the current one if it exists)
-- <leader> 1..9  jumps to the mark
for i = 1, 9 do
  local mark_char = string.char(64 + i) -- A=65, B=66, etc.
  nmap_leader(i, function()
    local mark_pos = vim.api.nvim_get_mark(mark_char, {})
    if mark_pos[1] == 0 then
      vim.notify("No mark for '" .. mark_char .. "'")
    else
      vim.cmd("normal! `" .. mark_char)                                                -- Jump to the mark
      local line_number = mark_pos[1]
      vim.notify("Currently in Mark " .. mark_char .. " (Line " .. line_number .. ")") -- Show line number
    end
  end, "Go to mark " .. mark_char)
end

for i = 1, 9 do
  local mark_char = string.char(64 + i) -- A=65, B=66, etc.
  vim.keymap.set("n", "<localleader>" .. i, function()
    vim.cmd("delmarks " .. mark_char)
    vim.cmd("mark " .. mark_char)
    vim.notify("Mark set for '" .. i .. "' (" .. mark_char .. ")")
  end, { desc = "Set mark " .. mark_char })
end

-- Delete a specific mark (1-9) across all buffers, with check for non-existing marks
vim.keymap.set("n", "<leader>bd", function()
  local mark_num = vim.fn.input("Delete mark (1-9): ") -- Prompt user for the mark number

  -- Check if the input is a valid number between 1 and 9
  if mark_num ~= "" and tonumber(mark_num) and tonumber(mark_num) >= 1 and tonumber(mark_num) <= 9 then
    local mark_char = string.char(64 + tonumber(mark_num)) -- Convert number to corresponding mark (A=65, B=66, ...)

    -- Check if the mark exists by getting its position
    local mark_pos = vim.api.nvim_get_mark(mark_char, {})

    -- If the mark exists
    if mark_pos[1] ~= 0 then
      vim.cmd("delmarks " .. mark_char) -- Delete the mark
      vim.notify("Deleted mark " .. mark_char, vim.log.levels.INFO)
    else
      vim.notify("No mark found for " .. mark_char, vim.log.levels.ERROR) -- Notify if mark doesn't exist
    end
  else
    vim.notify("Invalid input. Please enter a number between 1 and 9.", vim.log.levels.ERROR)
  end
end, { desc = "Delete specific mark (1-9) from all buffers" })

vim.keymap.set("n", "<leader>bb", function()
  -- Create a list to hold quickfix items
  local qf_list = {}

  -- Loop through all possible marks (A-I)
  for i = 1, 9 do
    local mark_char = string.char(64 + i) -- A=65, B=66, etc.
    local mark_pos = vim.api.nvim_get_mark(mark_char, {})

    -- Check if the mark exists
    if mark_pos[1] ~= 0 then
      -- Get the buffer number
      local buf_nr = mark_pos[3]
      -- Get the buffer name
      local buf_name = vim.api.nvim_buf_get_name(buf_nr)
      if buf_nr == 0 then
        buf_name = mark_pos[4]
      end

      -- Add to quickfix list
      table.insert(qf_list, {
        bufnr = buf_nr,
        filename = buf_name,
        lnum = mark_pos[1],
        col = mark_pos[2],
        text = "Mark " .. mark_char .. " (Line " .. mark_pos[1] .. ")", -- More descriptive text
      })
    end
  end

  -- Set the quickfix list
  vim.fn.setqflist(qf_list)

  -- Open the quickfix window if there are bookmarks
  if #qf_list > 0 then
    vim.cmd("copen")
  else
    vim.cmd("cclose")
  end
end, { desc = "List all bookmarks" })
