vim.g.mapleader = " "
local builtin = require("telescope.builtin")
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local conform = require("conform")

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit to terminal mode" })
vim.keymap.set("n", "<leader>tt", ":tabnew | terminal<CR>", { desc = "Open new terminal in new tab" })

-- Format Code --
vim.keymap.set("n", "<leader>cf", function()
	conform.format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end, { desc = "Format Code" })

-- Telescope --
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Telescope Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope Help Tags" })
vim.keymap.set('n', '<leader>ft', "<CMD>TodoTelescope<CR>", { desc = "Telescope Find TODO Comments" })

-- Windows --
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")

-- Buffers --
-- TODO: Falta poner el de eliminar todos menos el actual
vim.keymap.set("n", "<Tab>", "<CMD>bnext<CR>", { desc = "Go to next buffer" })
vim.keymap.set("n", "<S-Tab>", "<CMD>bprevious<CR>", { desc = "Go to prev buffer" })
vim.keymap.set("n", "<C-w>", "<CMD>bdelete<CR>", { desc = "Delete actual buffer" })

-- Hop --
vim.keymap.set("n", "f", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to find char after cursor", remap = true })
vim.keymap.set("n", "F", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to find char before cursor", remap = true })
vim.keymap.set("n", "t", function()
	hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
end, { desc = "Go to char in line after cursor", remap = true })
vim.keymap.set("n", "T", function()
	hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
end, { desc = "Go to char in line before cursor", remap = true })

-- Oil --
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open Oil" })
