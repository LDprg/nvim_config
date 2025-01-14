return {
    "tpope/vim-fugitive",
    event = "VeryLazy",
    config = function()
        vim.keymap.set("n", "<leader>g", "<nop>")
        vim.keymap.set("n", "<leader>gg", vim.cmd.Git, { desc = "Fugitive git open" })
        vim.keymap.set("n", "<leader>gp", function()
            vim.cmd.Git('push')
        end, { desc = "Fugitive git push" })
        vim.keymap.set("n", "<leader>gP", function()
            vim.cmd.Git({ 'pull', '--rebase' })
        end, { desc = "Fugitive git pull" })
        vim.keymap.set("n", "<leader>gc", function()
            vim.cmd.Git('commit')
        end, { desc = "Fugitive git commit" })
        vim.keymap.set("n", "<leader>gs", ":Git add --all<cr>", { desc = "Fugitive git stage all" })
    end
}
