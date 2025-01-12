return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>g", vim.cmd.Git, { desc = "Fugitive git open" })
        vim.keymap.set("n", "<leader>p", function()
            vim.cmd.Git("push")
        end, { desc = "Fugitive git push" })
        vim.keymap.set("n", "<leader>P", function()
            vim.cmd.Git({ 'pull', 'rebase' })
        end, { desc = "Fugitive git pull" })
    end
}
