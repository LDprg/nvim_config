return {
    'petertriho/nvim-scrollbar',
    dependencies = {
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        require("scrollbar").setup({
            set_highlights = true,
            handle = {
                blend = 0,
                color = "#080808",
            },
            marks = {
                -- Search = { color = Snacks.util.color("Search") },
                Search = { color = Snacks.util.color("Search") },
                Error = { color = Snacks.util.color("DiagnosticError") },
                Warn = { color = Snacks.util.color("DiagnosticWarning") },
                Info = { color = Snacks.util.color("DiagnosticInfo") },
                Hint = { color = Snacks.util.color("DiagnosticHint") },
                Misc = { color = Snacks.util.color("DiagnosticOk") },
            },
            handlers = {
                gitsigns = true, -- Requires gitsigns
            },
        })
        require("scrollbar.handlers.gitsigns").setup()
    end
}
