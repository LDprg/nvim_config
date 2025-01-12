return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        triggers = {},
        keys = {
            scroll_down = "<c-d>",
            scroll_up = "<c-u>",
        },
    },
    keys = {
        {
            "<C-h>",
            function()
                require("which-key").show({
                    global = false
                })
            end,
            desc = "Buffer Local Keymaps (which-key)",
        },
    },
}
