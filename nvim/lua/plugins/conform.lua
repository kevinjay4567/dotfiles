return {
	'stevearc/conform.nvim',
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "prettier" },
			typescript = { "prettier" },
		},
		format_on_save = {
			lsp_fallback = true,
			async = false,
			timeout_ms = 500,
		},
	},
}
