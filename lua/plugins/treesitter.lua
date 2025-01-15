return {
    "nvim-treesitter/nvim-treesitter",
    version = false, -- last release is way too old and doesn't work on Windows
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile", "BufWritePre", "VeryLazy" },
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    keys = {
        { "<c-cr>", desc = "Increment Selection" },
        { "<bs>",   desc = "Decrement Selection", mode = "x" },
    },
    opts = {
        highlight = {
            enable = true,
            disable = function(lang, buf)
                -- if lang == "html" then
                --     print("disabled")
                --     return true
                -- end

                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    Snacks.notify.warn(
                        "File larger than 100KB treesitter disabled for performance",
                        { title = "Treesitter" }
                    )
                    return true
                end
            end,

            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        ensure_installed = "all",
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-cr>",
                node_incremental = "<C-cr>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
    },
}
