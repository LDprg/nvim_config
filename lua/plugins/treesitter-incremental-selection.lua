return {
    "shushtain/nvim-treesitter-incremental-selection",
    event = "VeryLazy",
    keys = {
        { "<C-cr>", desc = "Increment Selection" },
        { "<bs>",   desc = "Decrement Selection", mode = "x" },
    },
    config = function()
        local tsis = require("nvim-treesitter-incremental-selection")

        vim.keymap.set("n", "<C-cr>", tsis.init_selection)
        vim.keymap.set("v", "<C-cr>", tsis.increment_node)
        vim.keymap.set("v", "<bs>", tsis.decrement_node)

        tsis.setup({})
    end
}
