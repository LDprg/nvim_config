return {
    'nvimdev/dashboard-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',
    opts = {
        hide = {
            statusline = false,
            tabline = false,
        },
    },
}
