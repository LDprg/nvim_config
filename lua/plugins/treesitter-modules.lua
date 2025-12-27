return {
	"MeanderingProgrammer/treesitter-modules.nvim",
	dependencies = { "nvim-treesitter/nvim-treesitter" },
	---@module 'treesitter-modules'
	---@type ts.mod.UserConfig
	opts = {
		incremental_selection = {
			enable = true,
			-- disable = false,
			-- set value to `false` to disable individual mapping
			-- node_decremental captures both node_incremental and scope_incremental
			keymaps = {
				init_selection = "<C-cr>",
				node_incremental = "<C-cr>",
				scope_incremental = false,
				node_decremental = "<bs>",
			},
		},
	},
}
