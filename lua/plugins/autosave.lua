return {
    "okuuva/auto-save.nvim",
    cmd = "ASToggle",                                     -- optional for lazy loading on command
    event = { "VeryLazy", "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
    opts = {
        enabled = false,
        -- your config goes here
        -- or just leave it empty :)
    },
}
