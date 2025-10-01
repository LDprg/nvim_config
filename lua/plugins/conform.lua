return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		notify_on_error = true,
		formatters_by_ft = {
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			svelte = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			markdown = { "prettierd" },
			lua = { "stylua" },
			-- rust = { "rustfmt", lsp_format = "fallback" },
			rust = { "dx_fmt", lsp_format = "first" },
		},
		formatters = {
			dx_fmt = {
				command = "dx",
				args = { "fmt", "--file", "$FILENAME" },
				stdin = false,
			},
		},
		default_format_opts = {
			lsp_format = "fallback",
		},
		format_on_save = function()
			if vim.g.autosave == nil then
				return {
					timeout_ms = 500,
					lsp_format = "fallback",
				}
			else
				return nil
			end
		end,
	},
}
