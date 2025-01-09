-- remove annoyances
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader>i", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end)
vim.keymap.set("n", "<leader>d", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>r", "<cmd>LspRestart<cr>")

-- vim.keymap.set("n", "<leader><leader>", "<cmd>so<cr>")

vim.keymap.set('v', '<C-c>', '"+y', { noremap = true, silent = true })
vim.keymap.set('n', '<C-v>', '"+p', { noremap = true, silent = true })

vim.lsp.inlay_hint.enable(true, nil)
