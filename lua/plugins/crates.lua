return {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    config = function()
        require('crates').setup {
            lsp = {
                enabled = true,
                actions = true,
                on_attach = function(client, bufnr) end,
                completion = true,
                hover = true,
            },
        }
    end,
}
