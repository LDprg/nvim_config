return {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    dependencies = "nvim-tree/nvim-web-devicons",

    opts = {
        options = {
            close_command = function(n)
                Snacks.bufdelete(n)
            end,
            right_mouse_command = function(n)
                Snacks.bufdelete(n)
            end,
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, _, _)
                local icon = level:match("error") and " " or " "
                return " " .. icon .. count
            end,
            offsets = {
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
}
