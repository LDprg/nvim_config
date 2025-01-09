return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },

    config = function()
        local open_with_trouble = require("trouble.sources.telescope").open

        local telescope = require("telescope")

        telescope.setup({
            defaults = {
                mappings = {
                    i = { ["<C-t>"] = open_with_trouble },
                    n = { ["<C-t>"] = open_with_trouble },
                },
            },
        })
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git files' })
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Telescope find files' })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = 'Telescope live grep' })
        vim.keymap.set('n', '<leader>pb', builtin.buffers, { desc = 'Telescope buffers' })
        vim.keymap.set('n', '<leader>ps', builtin.lsp_document_symbols, { desc = 'Telescope symbols' })
        vim.keymap.set('n', '<leader>pq', builtin.lsp_workspace_symbols, { desc = 'Telescope workspace symbols' })
        vim.keymap.set('n', '<leader>pt', builtin.diagnostics, { desc = 'Telescope diagnostics' })
        vim.keymap.set('n', '<leader>ph', builtin.help_tags, { desc = 'Telescope help tags' })
    end
}
