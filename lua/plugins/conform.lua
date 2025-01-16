return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                markdown = { "prettier" },
            },
            format_on_save = function()
                if vim.g.autosave == nil then
                    return {
                        timeout_ms = 500,
                        lsp_format = "fallback",
                    }
                else
                    return nil
                end
            end,
        })
    end
}
