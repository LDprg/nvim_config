vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader>ß", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Lsp toggle inly hint" })
vim.keymap.set("n", "<leader>d", vim.lsp.buf.code_action, { desc = "Lsp code action" })
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { desc = "Lsp format" })
vim.keymap.set("n", "<leader>r", "<cmd>LspRestart<cr>", { desc = "Lsp restart" })

vim.keymap.set('v', '<C-c>', '"+y', { desc = "Copy to system clipboard", noremap = true, silent = true })
