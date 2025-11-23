return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	version = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	opts = {
		install_dir = vim.fn.stdpath("data") .. "/site",
	},
	config = function(_, opts)
		local TS = require("nvim-treesitter")

		TS.setup(opts)

		TS.install("all")

		vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

		vim.api.nvim_create_autocmd("FileType", {
			pattern = TS.get_installed(),
			callback = function()
				vim.treesitter.start()
			end,
		})
	end,
}
