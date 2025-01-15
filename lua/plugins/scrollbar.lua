return {
    'petertriho/nvim-scrollbar',
    event = "VeryLazy",
    config = function()
        require("scrollbar").setup({
            handle = {
                color = "#080808",
            },
            marks = {
                Search = { color = Snacks.util.color("Search") },
                Error = { color = Snacks.util.color("DiagnosticError") },
                Warn = { color = Snacks.util.color("DiagnosticWarning") },
                Info = { color = Snacks.util.color("DiagnosticInfo") },
                Hint = { color = Snacks.util.color("DiagnosticHint") },
                Misc = { color = Snacks.util.color("DiagnosticOk") },
            }
        })
    end
}
