-- remove annoyances
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "<leader>r", "<cmd>LspRestart<cr>")

vim.keymap.set("n", "<leader><leader>", "<cmd>so<cr>")
