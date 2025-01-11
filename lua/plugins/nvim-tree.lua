return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        {
            'b0o/nvim-tree-preview.lua',
            dependencies = {
                'nvim-lua/plenary.nvim',
                '3rd/image.nvim', -- Optional, for previewing images
            },
        },
    },
    config = function()
        local api = require "nvim-tree.api"
        require("nvim-tree").setup {
            on_attach = function(bufnr)
                local function opts(desc)
                    return { desc = "NvimTree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings

                vim.keymap.set("n", "+", api.tree.change_root_to_node, opts('CD'))
                vim.keymap.set("n", "?", api.tree.toggle_help, opts('Help'))

                local preview = require('nvim-tree-preview')

                preview.setup {
                    image_preview = {
                        enable = true, -- Whether to preview images (for more info see Previewing Images section in README)
                        patterns = {   -- List of Lua patterns matching image file names
                            '.*%.png$',
                            '.*%.jpg$',
                            '.*%.jpeg$',
                            '.*%.gif$',
                            '.*%.webp$',
                            '.*%.avif$',
                            -- Additional patterns:
                            '.*%.svg$',
                            '.*%.bmp$',
                            -- '.*%.pdf$', (known to have issues)
                        },
                    },
                }

                vim.keymap.set('n', 'P', preview.watch, opts 'Preview (Watch)')
                vim.keymap.set('n', '<Esc>', preview.unwatch, opts 'Close Preview/Unwatch')
                vim.keymap.set('n', '<C-u>', function() return preview.scroll(-4) end, opts 'Scroll Up')
                vim.keymap.set('n', '<C-d>', function() return preview.scroll(4) end, opts 'Scroll Down')

                vim.keymap.set('n', '<Tab>', function()
                    preview.node_under_cursor({ toggle_focus = false })
                end, opts 'Preview')
            end,
            hijack_cursor = true,
            view = {
                number = true,
            },
            renderer = {
                group_empty = true,
                indent_width = 4,
                indent_markers = {
                    enable = true,
                    icons = {
                        item = '│',
                    }
                },
            },
            filters = {
                dotfiles = false,
            },
            update_focused_file = {
                enable = true,
            },
            actions = {
                open_file = {
                    quit_on_open = true,
                },
            },
            diagnostics = {
                enable = false,
            },
            modified = {
                enable = true,
            },
        }
        vim.keymap.set("n", "<leader>pv", function() api.tree.open({ current_window = true }) end,
            { desc = "NvimTree open", noremap = true })
    end,
}
