return {
    "saghen/blink.cmp",
    version = "*",
    build = "cargo build --release",
    dependencies = {
        "rafamadriz/friendly-snippets",
        -- add blink.compat to dependencies
        {
            "saghen/blink.compat",
            optional = true, -- make optional so it's only enabled if any extras need it
            opts = {},
            version = "*",
        },
    },
    event = "InsertEnter",
    opts = {
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
            menu = {
                draw = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            },
            ghost_text = {
                enabled = vim.g.ai_cmp,
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        keymap = {
            preset = "default",
            cmdline = {
                preset = 'super-tab',
            }
        },
    },
    config = function(_, opts)
        require("blink.cmp").setup(opts)
    end,
}
