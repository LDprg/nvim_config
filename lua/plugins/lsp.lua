return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        {
            'mrcjkb/rustaceanvim',
            version = '^5', -- Recommended
            lazy = false,   -- This plugin is already lazy
        },
        'saghen/blink.cmp',
    },
    opts = {
        -- Enable this to enable the builtin LSP inlay hints on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the inlay hints.
        inlay_hints = {
            enabled = true,
            exclude = { "vue" }, -- filetypes for which you don't want to enable inlay hints
        },
        -- Enable this to enable the builtin LSP code lenses on Neovim >= 0.10.0
        -- Be aware that you also will need to properly configure your LSP server to
        -- provide the code lenses.
        codelens = {
            enabled = true,
        },
        -- add any global capabilities here
        capabilities = {
            workspace = {
                fileOperations = {
                    didRename = true,
                    willRename = true,
                },
            },
        },
    },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()

        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            ensure_installed = {
                "lua_ls",
                "rust_analyzer@nightly",
                "gopls",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities,
                    }
                end,

                ["zls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.zls.setup({
                        capabilities = capabilities,
                        root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                        settings = {
                            zls = {
                                enable_inlay_hints = true,
                                enable_snippets = true,
                                warn_style = true,
                            },
                        },
                    })
                    vim.g.zig_fmt_parse_errors = 0
                    vim.g.zig_fmt_autosave = 0
                end,
                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "Lua 5.1" },
                                diagnostics = {
                                    globals = { "bit", "vim", "it", "describe", "before_each", "after_each", "Snacks" },
                                }
                            }
                        }
                    }
                end,
                ["rust_analyzer"] = function()
                end,
            },
        })

        local lspconfig = require("lspconfig")
        lspconfig.htmx.setup {}

        if vim.g.use_bacon_lsp then
            local configs = require("lspconfig.configs")
            if not configs.bacon_ls then
                configs.bacon_ls = {
                    default_config = {
                        cmd = { "bacon-ls" },
                        -- root_dir = require("lspconfig").util.root_pattern('Cargo.toml'),
                        root_dir = require("lspconfig").util.root_pattern('.git'),
                        filetypes = { "rust" },
                    },
                }
            end
            lspconfig.bacon_ls.setup({
                init_options = {
                    updateOnSave = true,
                    updateOnSaveWaitMillis = 500,
                    updateOnChange = true,
                    validateBaconPreferences = true,
                    createBaconPreferencesFile = true,
                    runBaconInBackground = true,
                },
                autostart = true
            })
        end

        vim.g.rustaceanvim = {
            server = {
                root_dir = require("lspconfig").util.root_pattern('Cargo.toml'),
                -- on_attach = function(_, bufnr)
                --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
                -- end,
                settings = {
                    -- rust-analyzer language server configuration
                    ['rust-analyzer'] = {
                        cargo = {
                            features = "all",
                        },
                        workspace = {
                            symbol = {
                                search = {
                                    kind = "all_symbols",
                                }
                            }
                        },
                        checkOnSave = {
                            enable = vim.g.use_bacon_lsp == false,
                        },
                        diagnostics = {
                            enable = vim.g.use_bacon_lsp == false,
                        },
                    },
                },
            },
        }

        vim.diagnostic.config({
            update_in_insert = true,
            severity_sort = true,
            virtual_text = true,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = "always",
                header = "",
                prefix = "",
            },
        })
    end,
}
