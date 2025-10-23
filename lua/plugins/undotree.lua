return {
	"mbbill/undotree",
	event = "VeryLazy",
	config = function()
		vim.keymap.set("n", "<leader>u", function()
			vim.cmd.UndotreeToggle()
			vim.cmd.UndotreeFocus()
		end, { desc = "Undotree open" })
	end,
}
