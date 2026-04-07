vim.g.mapleader = " "

local map = vim.keymap

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true

map.set('n', '<C-h>', '<C-w>h')
map.set("n", "<C-l>", "<C-w>l", nil)
map.set("n", "<C-j>", "<C-w>j", nil)
map.set("n", "<C-k>", "<C-w>k", nil)
map.set('n', '<Esc>', function() vim.cmd("nohlsearch") end)
map.set('n', '-', '<CMD>Oil<CR>', { desc = "open parent directory" })

vim.pack.add({
	{ src = 'https://github.com/rebelot/kanagawa.nvim', name = 'kanagawa' },
  { src = 'https://github.com/stevearc/oil.nvim', name = 'oil' },
  { src = 'https://github.com/nvim-lualine/lualine.nvim', name = 'lualine' },
})

require('kanagawa').setup({
	transparent = true,
	background = {
		dark = "dragon",
		light = "lotus",
	}
})

require('oil').setup({
  default_file_explorer = true,
  columns = {
    "permissions",
    "size",
    "mtime"
  }
})

require("lualine").setup({
  options = {
    icons_enabled = true,
    theme = "seoul256",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
})

vim.cmd("colorscheme kanagawa")
