return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "JMarkin/nvim-tree.lua-float-preview",
    },
    config = function()
        local api = require "nvim-tree.api"
        require("nvim-tree").setup {
            on_attach = function(bufnr)
                local function opts(desc)
                    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
                end

                -- default mappings
                api.config.mappings.default_on_attach(bufnr)

                -- custom mappings

                vim.keymap.set("n", "+", api.tree.change_root_to_node, opts('CD'))
                vim.keymap.set("n", "?", api.tree.toggle_help, opts('Help'))

                vim.keymap.set('n', '<Tab>', function()
                    local ok, node = pcall(api.tree.get_node_under_cursor)
                    if ok and node then
                        if node.type == 'directory' then
                            api.node.open.edit()
                        end
                    end
                end, opts 'Expand directory')

                local preview = require('float-preview')

                HEIGHT_PADDING = 2
                WIDTH_PADDING = 2
                preview.setup({
                    window = {
                        wrap = false,
                        trim_height = false,
                        open_win_config = function()
                            local screen_w = vim.opt.columns:get()
                            local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                            local window_w_f = (screen_w - WIDTH_PADDING * 2 - 1) / 2
                            local window_w = math.floor(window_w_f)
                            local window_h = screen_h - HEIGHT_PADDING * 2
                            local center_x = window_w_f + WIDTH_PADDING + 2
                            local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()

                            return {
                                style = "minimal",
                                relative = "editor",
                                border = "single",
                                row = center_y,
                                col = center_x,
                                width = window_w,
                                height = window_h
                            }
                        end
                    }
                })

                preview.attach_nvimtree(bufnr)
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
