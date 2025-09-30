return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "j-hui/fidget.nvim",
        {
            'mrcjkb/rustaceanvim',
            version = '^6', -- Recommended
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
        require("fidget").setup({})
        require("mason").setup({})
        require("mason-lspconfig").setup({
            automatic_enable = {
                exclude = {
                    "rust_analyzer",
                }
            },
            ensure_installed = {
                "lua_ls",
                "rust_analyzer@nightly",
                "gopls",
            },
        })

        local lspconfig = require("lspconfig")
        vim.lsp.config("zls", {
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

        vim.lsp.config("clangd", {
            root_dir = lspconfig.util.root_pattern(".git", ".clangd"),
            filetypes = { 'c', 'cpp', 'objc', 'objcpp', 'cuda' },
            cmd = {
                "clangd",
                "--all-scopes-completion",
                "--background-index",
                "--clang-tidy",
                "--completion-parse=always",
                "--completion-style=detailed",
                "--cross-file-rename",
                "--enable-config",
                "--fallback-style=llvm",
                "--function-arg-placeholders",
                "--pch-storage=memory",
                "-j=8",
                "--log=verbose",
            },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    diagnostics = {
                        global = { "bit", "vim", "it", "describe", "before_each", "after_each", "Snacks" },
                    }
                }
            }
        })

        vim.g.rustaceanvim = {
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        procMacro = {
                            ignored = {
                                leptos_macro = {
                                    -- optional: --
                                    -- "component",
                                    "server",
                                },
                            },
                        },
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
                        }
                    }
                },
            },
        }

        vim.lsp.config("rust_analyzer", {
            server = {
                cmd = function()
                    local mason_registry = require('mason-registry')
                    if mason_registry.is_installed('rust-analyzer') then
                        -- This may need to be tweaked depending on the operating system.
                        local ra = mason_registry.get_package('rust-analyzer')
                        local ra_filename = ra:get_receipt():get().links.bin['rust-analyzer']
                        return { ('%s/%s'):format(ra:get_install_path(), ra_filename or 'rust-analyzer') }
                    else
                        -- global installation
                        return { 'rust-analyzer' }
                    end
                end,
            },
        })

        vim.lsp.config("tailwindcss", {
            filetypes = { "html", "css", "scss", "javascript", "javascriptreact",
                "typescript", "typescriptreact", "svelte", "rust" },
            settings = {
                tailwindCSS = {
                    includeLanguages = { rust = "html" }
                }
            }
        })

        vim.lsp.config("emmet_ls", {
            filetypes = { "css", "eruby", "html", "javascript", "javascriptreact", "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue", "rust" }
        })

        -- local lspconfig = require("lspconfig")
        -- lspconfig.htmx.setup {}
        -- lspconfig.ccls.setup {}

        -- if vim.g.use_bacon_lsp then
        --     local configs = require("lspconfig.configs")
        --     if not configs.bacon_ls then
        --         configs.bacon_ls = {
        --             default_config = {
        --                 cmd = { "bacon-ls" },
        --                 -- root_dir = require("lspconfig").util.root_pattern('Cargo.toml'),
        --                 root_dir = require("lspconfig").util.root_pattern('.git'),
        --                 filetypes = { "rust" },
        --             },
        --         }
        --     end
        --     lspconfig.bacon_ls.setup({
        --         init_options = {
        --             updateOnSave = true,
        --             updateOnSaveWaitMillis = 250,
        --             updateOnChange = true,
        --             validateBaconPreferences = true,
        --             createBaconPreferencesFile = true,
        --             runBaconInBackground = true,
        --         },
        --         autostart = true
        --     })
        -- end

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
