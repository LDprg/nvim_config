return {
    "tpope/vim-fugitive",
    config = function()
        vim.keymap.set("n", "<leader>g", vim.cmd.Git)
        vim.keymap.set("n", "<leader>p", function ()
            vim.cmd.Git("push")
        end)
        vim.keymap.set("n", "<leader>P", function ()
            vim.cmd.Git({'pull', 'rebase'})
        end)
    end
}

