vim.g.mapleader = " "

local map = vim.keymap.set
local telescope = require('telescope.builtin')
local conform = require('conform')
local harpoon = require('harpoon')
local hop = require('hop')
local directions = require('hop.hint').HintDirection


map("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit to terminal mode" })
map("n", "<leader>tt", ":tabnew | terminal<CR>", { desc = "Open new terminal in new tab" })

-- Format Code --
map("n", "<leader>cf", function()
  conform.format({ lsp_fallback = true, async = false, timeout_ms = 500 })
end, { desc = "Format Code" })

-- Telescope --
map("n", "<leader>ff", telescope.find_files, { desc = "Telescope Find Files" })
map('n', '<leader>fl', telescope.live_grep, { desc = "Telescope Live Grep" })
map('n', '<leader>fb', telescope.buffers, { desc = "Telescope Buffers" })
map('n', '<leader>fh', telescope.help_tags, { desc = "Telescope Help Tags" })
map('n', '<leader>ft', "<CMD>TodoTelescope<CR>", { desc = "Telescope Find TODO Comments" })

-- Windows --
map("n", "<C-h>", "<C-w>h", nil)
map("n", "<C-l>", "<C-w>l", nil)
map("n", "<C-j>", "<C-w>j", nil)
map("n", "<C-k>", "<C-w>k", nil)

-- Harpoon --
map("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add buffer in Harpoon menu" })
map("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon menu" })
map("n", "<C-1>", function() harpoon:list():select(1) end, { desc = "Go to Harpoon 1" })
map("n", "<C-2>", function() harpoon:list():select(2) end, { desc = "Go to Harpoon 2" })
map("n", "<C-3>", function() harpoon:list():select(3) end, { desc = "Go to Harpoon 3" })
map("n", "<C-4>", function() harpoon:list():select(4) end, { desc = "Go to Harpoon 4" })

-- Hop --
map("n", "f", function() hop.hint_char1({ direction = directions.AFTER_CURSOR }) end,
  { desc = "Go to find char after cursor", remap = true })
map("n", "F", function() hop.hint_char1({ direction = directions.BEFORE_CURSOR }) end,
  { desc = "Go to find char before cursor", remap = true })
map("n", "t",
  function() hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 }) end,
  { desc = "Go to char in line after cursor", remap = true })
map("n", "T",
  function() hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 }) end,
  { desc = "Go to char in line before cursor", remap = true })

-- Oil --
map("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
