return {
    "folke/tokyonight.nvim",
    lazy = true,
    init = function()
        vim.cmd.colorscheme 'tokyonight-night'
    end,
}
