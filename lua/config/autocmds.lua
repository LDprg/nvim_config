-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local group = vim.api.nvim_create_augroup("autosave", {})

-- autosave for disabling automatic formatting
vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveWritePre",
	group = group,
	callback = function(opts)
		if opts.data.saved_buffer ~= nil then
			local filename = vim.api.nvim_buf_get_name(opts.data.saved_buffer)
			vim.g.autosave = filename
		end
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveWritePost",
	group = group,
	callback = function(opts)
		if opts.data.saved_buffer ~= nil then
			vim.g.autosave = nil
		end
	end,
})

-- autosave_enabled global for lualine
vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveEnable",
	group = group,
	callback = function(_)
		vim.g.autosave_enabled = true
		-- vim.notify('AutoSave enabled', vim.log.levels.INFO)
	end,
})

vim.api.nvim_create_autocmd("User", {
	pattern = "AutoSaveDisable",
	group = group,
	callback = function(_)
		vim.g.autosave_enabled = false
		-- vim.notify('AutoSave disabled', vim.log.levels.INFO)
	end,
})

-- mhdl
if vim.fn.isdirectory("/home/ld/git/mhdl/") == 1 then
	vim.api.nvim_create_autocmd("User", {
		pattern = "TSUpdate",
		callback = function()
			require("nvim-treesitter.parsers").mhdl = {
				install_info = {
					path = "/home/ld/git/mhdl/",
					location = "tree-sitter-mhdl",
					generate = true,
					queries = "queries",
				},
			}
		end,
	})

	vim.filetype.add({
		extension = {
			mhdl = "mhdl",
		},
	})

	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "mhdl" },
		callback = function()
			vim.treesitter.start()
		end,
	})
end

-- tree-sitter grammar.js info
if vim.fn.executable("/opt/tree-sitter-grammar-lsp/tree-sitter-grammar-lsp-linux") == 1 then
	vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
		pattern = { "grammar.js", "*/corpus/*.txt" },
		callback = function(ev)
			vim.lsp.start({
				name = "tree-sitter-grammar",
				cmd = { "/opt/tree-sitter-grammar-lsp/tree-sitter-grammar-lsp-linux" },
				root_dir = vim.fs.dirname(ev.file),
				handlers = {
					["window/showMessage"] = function(_, result)
						if result.type == vim.lsp.log_levels.ERROR then
							Snacks.notify.error(result.message)
						end
					end,
				},
			})
		end,
	})
end
