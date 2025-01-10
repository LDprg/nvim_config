return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {
        exclude = {
            filetypes = { 'dashboard' },
        },
        indent = { char = "│" },
        scope = { enabled = false },
    },
}
