return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
            globalstatus = vim.o.laststatus == 3,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },

            lualine_c = {
                {
                    "diagnostics",
                },
                { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            },
            lualine_y = {
                { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                { "location", padding = { left = 0, right = 1 } },
            },
            lualine_z = {
                function()
                    return " " .. os.date("%R")
                end,
            },
        },
        extensions = { "neo-tree", "lazy", "fzf" },
    },
}
