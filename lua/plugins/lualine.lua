return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            theme = "auto",
            globalstatus = vim.o.laststatus == 3,
            disabled_filetypes = {
                statusline = {
                    "dashboard",
                    "alpha",
                    "ministarter",
                    "snacks_dashboard",
                },
            },
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },

            lualine_c = {
                {
                    "diagnostics",
                },
                { "filetype", separator = "", padding = { left = 1, right = 0 } },
            },
            lualine_x = {
                {
                    function()
                        if vim.g.autosave_enabled then
                            return "AS"
                        else
                            return "MS"
                        end
                    end,
                    color = function()
                        if vim.g.autosave_enabled then
                            return { fg = Snacks.util.color("WarningMsg") }
                        else
                            return { fg = Snacks.util.color("Normal") }
                        end
                    end,
                },
                {
                    function()
                        return require("noice").api.status.command.get()
                    end,
                    cond = function()
                        return package.loaded["noice"] and require("noice").api.status.command.has()
                    end,
                    color = function()
                        return { fg = Snacks.util.color("Statement") }
                    end,
                },
                {
                    function()
                        return require("noice").api.status.mode.get()
                    end,
                    cond = function()
                        return package.loaded["noice"] and require("noice").api.status.mode.has()
                    end,
                    color = function()
                        return { fg = Snacks.util.color("Constant") }
                    end,
                },
                {
                    require("lazy.status").updates,
                    cond = require("lazy.status").has_updates,
                    color = function()
                        return { fg = Snacks.util.color("Special") }
                    end,
                },
                {
                    "diff",
                    source = function()
                        local gitsigns = vim.b.gitsigns_status_dict
                        if gitsigns then
                            return {
                                added = gitsigns.added,
                                modified = gitsigns.changed,
                                removed = gitsigns.removed,
                            }
                        end
                    end,
                },
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
        extensions = { "neo-tree", "lazy", "fzf", "trouble", "mason" },
    },
}
