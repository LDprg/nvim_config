-- remove annoyances
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
