return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>g", vim.cmd.Git, { desc = "Fugitive git open" })
    end
}
