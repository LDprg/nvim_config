return {
	"zaldih/themery.nvim",
	lazy = false,
	dependencies = {
		{ "catppuccin/nvim", name = "catppuccin", priority = 1000 },
		-- { "bluz71/vim-moonfly-colors", name = "moonfly",      lazy = false,   priority = 1000 },
		{ "folke/tokyonight.nvim", name = "tokyonight", lazy = false, priority = 1000 },

		{ "LDprg/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000 },
	},
	opts = {
		themes = {
			"catppuccin",
			"moonfly",
			"tokyonight-night",
		},
	},
}
