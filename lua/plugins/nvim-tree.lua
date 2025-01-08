return {
    "nvim-tree/nvim-tree.lua",
    config = function ()
        require("nvim-tree").setup{
            on_attach = function (bufnr)
                local api = require "nvim-tree.api"

                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings
                vim.keymap.set("n", "<leader>pv", function() api.tree.open({ current_window = true }) end, { noremap = true })
                vim.keymap.set("n", "+", api.tree.change_root_to_node, opts('CD'))
                vim.keymap.set("n", "?", api.tree.toggle_help, opts('Help'))
            end,
            view = {
                number = true,
            },
            filters = {
                dotfiles = false,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
        }
    end,
}
