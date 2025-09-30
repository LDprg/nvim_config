-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.have_nerd_font = true
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

vim.g.use_bacon_lsp = false

vim.g.moonflyVirtualTextColor = true
vim.g.moonflyUnderlineMatchParen = true
-- vim.g.moonflyCursorColor = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.autosave_enabled = true
vim.g.autosave_disable_inside_paths = { vim.fn.stdpath('config') }

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.showmode = false

vim.opt.cursorline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "140"
vim.opt.fileencoding = "utf-8"
