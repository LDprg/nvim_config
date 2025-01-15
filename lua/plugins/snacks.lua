return {
    "snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true, notify = true },
        indent = {
            enabled = true,
            filter = function(buf)
                return vim.g.snacks_indent ~= false and vim.b[buf].snacks_indent ~= false and vim.bo[buf].buftype == ""
            end,
        },
        input = { enabled = true, },
        notifier = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = true },
    },
    keys = {
        { "<leader>nn", function() Snacks.notifier.show_history() end, desc = "Notification History" },
        { "<leader>nx", function() Snacks.notifier.hide() end,         desc = "Dismiss All Notifications" },
    },
}
