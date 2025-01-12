return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        triggers = {}
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
