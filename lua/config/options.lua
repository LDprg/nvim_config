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

-- vim.g.rustaceanvim = {
--     server = {
--         -- root_dir = require("lspconfig").util.root_pattern('Cargo.toml'),
--         -- on_attach = function(_, bufnr)
--         --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
--         -- end,
--         cmd = function()
--             local mason_registry = require('mason-registry')
--             if mason_registry.is_installed('rust-analyzer') then
--                 -- This may need to be tweaked depending on the operating system.
--                 local ra = mason_registry.get_package('rust-analyzer')
--                 local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
--                 return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
--             else
--                 -- global installation
--                 return { 'rust-analyzer' }
--             end
--         end,
--         default_settings = {
--             -- rust-analyzer language server configuration
--             ['rust-analyzer'] = {
--                 procMacro = {
--                     ignored = {
--                         leptos_macro = {
--                             -- optional: --
--                             -- "component",
--                             "server",
--                         },
--                     },
--                 },
--                 cargo = {
--                     features = "all",
--                 },
--                 workspace = {
--                     symbol = {
--                         search = {
--                             kind = "all_symbols",
--                         }
--                     }
--                 },
--                 checkOnSave = {
--                     enable = vim.g.use_bacon_lsp == false,
--                 },
--                 diagnostics = {
--                     enable = vim.g.use_bacon_lsp == false,
--                 },
--             },
--         },
--     },
-- }
