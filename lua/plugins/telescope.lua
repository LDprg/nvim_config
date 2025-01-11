return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
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
                            action = function(selection)
                                vim.cmd.edit(selection.path)
                            end,
                            after_action = function(selection)
                                print('(' .. selection.z_score .. ') ' .. selection.path)
                            end,
                        },
                    },
                }
            }
        })

        telescope.load_extension('zoxide')

        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, { desc = 'Telescope symbols' })
        vim.keymap.set('n', '<leader>pq', builtin.lsp_workspace_symbols, { desc = 'Telescope workspace symbols' })
        vim.keymap.set('n', '<leader>pt', builtin.diagnostics, { desc = 'Telescope diagnostics' })
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })

        vim.keymap.set('n', '<leader>pv', telescope.extensions.zoxide.list, { desc = 'Telescope zoxide' })
    end
}
