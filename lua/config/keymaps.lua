-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "q", "<nop>")
vim.keymap.set("n", "<leader>p", "<nop>")
vim.keymap.set("n", "<leader>p<leader>", "<nop>")

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })

vim.keymap.set("n", "K", "mzJ`z", { desc = "Remove end line" })
vim.keymap.set("n", "J", "i<cr><esc>", { desc = "Break line at cursor" })

vim.keymap.set({ "n", "i" }, "<M-k>", "<cmd>bprev<cr>", { desc = "Previous buffer" })
vim.keymap.set({ "n", "i" }, "<M-j>", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set({ "n", "i" }, "<M-w>", "<cmd>bdel<cr>", { desc = "Close buffer" })
vim.keymap.set({ "n", "i" }, "<M-right>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer next" })
vim.keymap.set({ "n", "i" }, "<M-left>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer prev" })

vim.keymap.set("n", "<leader>k", "<cmd>cprev<CR>zz", { desc = "Previous error" })
vim.keymap.set("n", "<leader>j", "<cmd>cnext<CR>zz", { desc = "Next error" })

vim.keymap.set("n", "<C-k>", vim.diagnostic.goto_prev, { desc = "Next lsp error" })
vim.keymap.set("n", "<C-j>", vim.diagnostic.goto_next, { desc = "Next lsp error" })

vim.keymap.set({ "n", "i" }, "<c-s>", "<cmd>ASToggle<cr>", { desc = "Autosave toggle" })

vim.keymap.set("n", "O", "o<esc>", { desc = "Insert empty line" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]], { desc = "Copy line to system" })
vim.keymap.set({ "n", "v" }, "<leader>w", [["+p]], { desc = "Paste from system after" })
vim.keymap.set({ "n", "v" }, "<leader>W", [["+P]], { desc = "Paste from system before" })

vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { desc = "Lsp rename" })

vim.keymap.set("n", "<leader>ß", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Lsp toggle inly hint" })
vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float()
end, { desc = "Show floating diagnostic" })

vim.api.nvim_set_keymap(
    "n",
    "n",
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
    "n",
    "N",
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    { noremap = true, silent = true }
)
vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader><leader>", "<Cmd>noh<CR>", { desc = "Clear Highlight" })

vim.keymap.set("n", "<leader>qs", function()
    require("persistence").load()
end, { desc = "Persistence load dir" })
vim.keymap.set("n", "<leader>qS", function()
    require("persistence").select()
end, { desc = "Persistence select" })
vim.keymap.set("n", "<leader>ql", function()
    require("persistence").load({ last = true })
end, { desc = "Persistence load last" })

vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action, { desc = "Lsp code action" })
vim.keymap.set("n", "<leader>h", function()
    vim.lsp.buf.hover({
        focusable = false,
        border = "rounded",
    })
end, { desc = "Lsp code hover" })
vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true })
end, { desc = "Lsp format" })
vim.keymap.set("n", "<leader>pr", "<cmd>LspRestart<cr>", { desc = "Lsp restart" })
