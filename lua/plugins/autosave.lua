return {
	"okuuva/auto-save.nvim",
	cmd = "ASToggle",
	event = { "VeryLazy", "InsertLeave", "TextChanged" },
	opts = {
		enabled = false,
	},
}
