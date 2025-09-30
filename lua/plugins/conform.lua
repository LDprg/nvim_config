return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
        formatters_by_ft = {
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescriptreact = { "prettierd" },
            svelte = { "prettierd" },
            css = { "prettierd" },
            html = { "prettierd" },
            json = { "prettierd" },
            markdown = { "prettierd" },
            rust = { "rustfmt", lsp_format = "fallback" },
        },
        default_format_opts = {
            lsp_format = "fallback",
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
    }
}
