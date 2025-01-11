return {
    "luftaquila/nvim-cursorline",
    event = "VimEnter",
    config = function()
        require("nvim-cursorline").setup {
            cursorline = {
                enable = false,
            }
        }
    end,
}
