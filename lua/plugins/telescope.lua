return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'echasnovski/mini.icons',

        'qw457812/telescope-zoxide',
        -- 'jvgrootveld/telescope-zoxide',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },

    config = function()
        local telescope = require('telescope')
        local open_with_trouble = require("trouble.sources.telescope").open

        telescope.setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-t>"] = open_with_trouble,
                        ['<C-h>'] = 'which_key',
                    },
                    n = {
                        ["<C-t>"] = open_with_trouble,
                        ['<C-h>'] = 'which_key',
                    },
                },
            },
            extensions = {
                zoxide = {
                    prompt_title = '[ Find Directories ]',
                    mappings = {
                        default = {
                            after_action = function(selection)
                                print('(' .. selection.z_score .. ') ' .. selection.path)
                            end,
                        },
                    },
                    path_display = function(opts, path)
                        local transformed_path = vim.trim(path)

                        -- Replace home with ~
                        local home = (vim.uv or vim.loop).os_homedir()
                        transformed_path = home and transformed_path:gsub("^" .. vim.pesc(home), "~") or transformed_path

                        -- Directory icon
                        local icon, icon_hl = require("mini.icons").get("directory", path)
                        icon = icon .. " "
                        local icon_width = require("plenary.strings").strdisplaywidth(icon)

                        -- Truncate
                        local calc_result_length = function(truncate_len)
                            local status = require("telescope.state").get_status(vim.api.nvim_get_current_buf())
                            -- NOTE: Compatibility with telescope.nvim 0.1.8
                            local results_win = vim.tbl_get(status, "layout", "results", "winid") or status.results_win
                            local len = vim.api.nvim_win_get_width(results_win) - status.picker.selection_caret:len() - 2
                            return type(truncate_len) == "number" and len - truncate_len or len
                        end
                        local truncate_len = nil
                        if opts.__length == nil then
                            opts.__length = calc_result_length(truncate_len)
                        end
                        if opts.__prefix == nil then
                            opts.__prefix = 0
                        end
                        transformed_path = icon
                            .. require("plenary.strings").truncate(transformed_path,
                                opts.__length - opts.__prefix - icon_width, nil, -1)

                        -- Dim parent directories
                        local tail = require("telescope.utils").path_tail(path)
                        local path_style = {
                            { { 0, #icon },                         icon_hl },
                            { { #icon, #transformed_path - #tail }, "Comment" },
                        }
                        return transformed_path, path_style
                    end,
                },
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    -- the default case_mode is "smart_case"
                },
            },
        })

        telescope.load_extension('zoxide')
        telescope.load_extension('fzf')
        -- telescope.load_extension("noice")

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, { desc = 'Telescope symbols' })
        vim.keymap.set('n', '<leader>pq', builtin.lsp_workspace_symbols, { desc = 'Telescope workspace symbols' })
        vim.keymap.set('n', '<leader>pd', builtin.diagnostics, { desc = 'Telescope diagnostics' })
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })

        vim.keymap.set('n', '<leader>pv', telescope.extensions.zoxide.list, { desc = 'Telescope zoxide' })
    end
}
