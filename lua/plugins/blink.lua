return {
	"saghen/blink.cmp",
	version = "*",
	build = "cargo build --release",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"L3MON4D3/LuaSnip",
		-- add blink.compat to dependencies
		{
			"saghen/blink.compat",
			version = "*",
			opts = {},
		},
	},
	event = "InsertEnter",
	opts = {
		snippets = { preset = "luasnip" },
		appearance = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = false,
			-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},
		completion = {
			accept = {
				-- experimental auto-brackets support
				auto_brackets = {
					enabled = true,
				},
			},
			list = {
				selection = {
					auto_insert = false,
				},
			},
			menu = {
				border = "rounded",
				scrollbar = true,
				draw = {
					treesitter = { "lsp" },
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } },
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 200,
			},
			ghost_text = {
				enabled = false,
			},
		},
		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
		},
		keymap = {
			preset = "default",
			["<C-y>"] = { "select_and_accept" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },

			["<Up>"] = {},
			["<Down>"] = {},
		},
		cmdline = {
			keymap = {
				preset = "super-tab",
				["<C-y>"] = { "select_and_accept" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
			},
		},
	},
}
