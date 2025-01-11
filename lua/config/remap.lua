-- Disabled Shortcuts
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "q", "<nop>")

-- Keymaps
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system" })

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Insert line above" })

vim.keymap.set("n", "<leader>ß", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Lsp toggle inly hint" })

vim.keymap.set("n", "<leader>d", vim.lsp.buf.code_action, { desc = "Lsp code action" })
vim.keymap.set("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", { desc = "Lsp format" })
vim.keymap.set("n", "<leader>r", "<cmd>LspRestart<cr>", { desc = "Lsp restart" })
