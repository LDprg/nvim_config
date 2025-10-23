return {
	"petertriho/nvim-scrollbar",
	event = "VeryLazy",
	dependencies = {
		"lewis6991/gitsigns.nvim",
	},
	config = function()
		require("scrollbar").setup({
			handle = {
				blend = 70,
				color = Snacks.util.color("Comment"),
			},
			marks = {
				Search = { color = Snacks.util.color("Search") },
				Error = { color = Snacks.util.color("DiagnosticError") },
				Warn = { color = Snacks.util.color("DiagnosticWarning") },
				Info = { color = Snacks.util.color("DiagnosticInfo") },
				Hint = { color = Snacks.util.color("DiagnosticHint") },
				Misc = { color = Snacks.util.color("DiagnosticOk") },
			},
			handlers = {
				search = true, -- Requires hlslens
				gitsigns = true, -- Requires gitsigns
			},
			excluded_buftypes = {
				"terminal",
				"nofile",
			},
			excluded_filetypes = {
				"dropbar_menu",
				"dropbar_menu_fzf",
				"DressingInput",
				"cmp_docs",
				"cmp_menu",
				"noice",
				"prompt",
				"TelescopePrompt",
				"snacks_dashboard",
				"blink-cmp-menu",
				"blink-cmp-documentation",
			},
		})
		require("scrollbar.handlers.gitsigns").setup()
		require("scrollbar.handlers.search").setup()
	end,
}
