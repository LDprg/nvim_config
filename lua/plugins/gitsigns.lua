return {
    "lewis6991/gitsigns.nvim",
    opts = {
        current_line_blame = true,
        numhl              = true,
    },
    config = function()
        require('gitsigns').setup()
         require("scrollbar.handlers.gitsigns").setup()
    end
}
