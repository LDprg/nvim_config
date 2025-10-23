return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
	cmd = { "TSUpdate", "TSInstall", "TSLog", "TSUninstall" },
	opts_extend = { "ensure_installed" },
	opts = {
		-- LazyVim config for treesitter
		indent = { enable = true },
		highlight = {
			enable = true,

			disable = function(_, buf)
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					Snacks.notify.warn(
						"File larger than 100KB treesitter disabled for performance",
						{ title = "Treesitter" }
					)
					return true
				end
			end,
		},
		folds = { enable = true },
		ensure_installed = "all",
	},
}
