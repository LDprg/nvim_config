return {
    "folke/trouble.nvim",
    cmd = { "Trouble" },
    opts = {
        focus = true,
    },
    keys = {
        {
            "<leader>tT",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "Trouble diagnostics",
        },
        {
            "<leader>tL",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "Trouble location list",
        },
        {
            "<leader>tq",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "Trouble quickfix list",
        },
        {
            "<leader>ts",
            "<cmd>Trouble symbols toggle focus=true<cr>",
            desc = "Trouble symbols",
        },
        {
            "<leader>tl",
            "<cmd>Trouble lsp toggle focus=true win.position=right<cr>",
            desc = "Trouble lsp definitions / references / ...",
        },
        {
            "<leader>tt",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Trouble buffer diagnostics",
        }

    },
}