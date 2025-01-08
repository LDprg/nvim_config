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
                vim.keymap.set("n", "?", api.tree.toggle_help, opts('Help'))
            end,
        }
    end,
}