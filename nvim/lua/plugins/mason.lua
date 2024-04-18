return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"jayp0521/mason-null-ls.nvim",
	},
	config = function()
		-- import mason plugin safely
		local mason = require("mason")

		-- enable mason
		mason.setup({
			ensure_installed = {
				"lua-language-server",
				"stylua",
				"prettier",
				"tsserver",
				"html",
				"cssls",
			}
		})
	end,
}
