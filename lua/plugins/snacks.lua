return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        bigfile = { enabled = true, notify = true },
        indent = { enabled = true },
        -- input = { enabled = true, },
        notifier = { enabled = true },
        scope = { enabled = true },
        -- scroll = { enabled = true },
        statuscolumn = { enabled = false },
        words = { enabled = true },
        dashboard = {
            enabled = true,
            sections = {
                {
                    section = "terminal",
                    cmd = "colorscript -e square",
                    height = 5,
                    padding = 1,
                },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    icon = " ",
                    title = "Git Status",
                    section = "terminal",
                    enabled = function()
                        return Snacks.git.get_root() ~= nil
                    end,
                    cmd = "git status --short --branch --renames",
                    height = 5,
                    padding = 1,
                    ttl = 5 * 60,
                    indent = 3,
                    action = function()
                        Snacks.lazygit.open()
                    end,
                    key = "G",
                },
                { pane = 2, section = "header" },
                { pane = 2, section = "keys",   gap = 1, padding = 1 },
                { pane = 2, section = "startup" },
            },
        },
        lazygit = {
            configure = true,
        },
    },
    keys = {
        {
            "<leader>nn",
            function()
                Snacks.notifier.show_history()
            end,
            desc = "Notification History",
        },
        {
            "<leader>nx",
            function()
                Snacks.notifier.hide()
            end,
            desc = "Dismiss All Notifications",
        },
        {
            "<leader>g",
            function()
                Snacks.lazygit.open()
            end,
            desc = "Lazygit",
        },
        {
            "<leader>pl",
            function()
                Snacks.lazygit.log()
            end,
            desc = "Lazygit log",
        },
        {
            "<leader>l",
            function()
                Snacks.lazygit.log_file()
            end,
            desc = "Lazygit file log",
        },
    },
}
