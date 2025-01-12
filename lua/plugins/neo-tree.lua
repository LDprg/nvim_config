return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
        "3rd/image.nvim",
    },
    cmd = "Neotree",
    keys = {
        {
            "<leader>pe",
            function()
                require("neo-tree.command").execute({ toggle = true })
            end,
            desc = "Explorer NeoTree"
        },
    },
    opts = {
        sources = { "filesystem", "buffers", "git_status" },
        open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
        filesystem = {
            bind_to_cwd = false,
            use_libuv_file_watcher = true,
            group_empty_dirs = true,
            filtered_items = {
                visible = true,
            },
            follow_current_file = {
                enabled = true
            },
        },
        window = {
            position = "left",
            width = "75%",
        },
        default_component_configs = {
            indent = {
                with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                expander_collapsed = "",
                expander_expanded = "",
                expander_highlight = "NeoTreeExpander",
            },
            git_status = {
                symbols = {
                    unstaged = "󰄱",
                    staged = "󰱒",
                },
            },
        },
        event_handlers = {
        },
    },
    init = function()
        -- FIX: use `autocmd` for lazy-loading neo-tree instead of directly requiring it,
        -- because `cwd` is not set up properly.
        vim.api.nvim_create_autocmd("BufEnter", {
            group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
            desc = "Start Neo-tree with directory",
            once = true,
            callback = function()
                if package.loaded["neo-tree"] then
                    return
                else
                    local stats = vim.uv.fs_stat(vim.fn.argv(0))
                    if stats and stats.type == "directory" then
                        require("neo-tree")
                    end
                end
            end,
        })
    end,
    config = function(_, opts)
        local function on_move(data)
            Snacks.rename.on_rename_file(data.source, data.destination)
        end

        local events = require("neo-tree.events")
        opts.event_handlers = {
            { event = events.FILE_MOVED,   handler = on_move },
            { event = events.FILE_RENAMED, handler = on_move },
            {
                event = events.AFTER_RENDER,
                handler = function()
                    local state = require('neo-tree.sources.manager').get_state('filesystem')
                    if not require('neo-tree.sources.common.preview').is_active() then
                        state.config = { use_float = true, use_image_nvim = true }
                        state.commands.toggle_preview(state)
                    end
                end
            },
            {
                event = events.FILE_OPENED,
                handler = function()
                    require("neo-tree.command").execute({ action = "close" })
                end,
            },
        }
        require("neo-tree").setup(opts)
        vim.api.nvim_create_autocmd("TermClose", {
            pattern = "*lazygit",
            callback = function()
                if package.loaded["neo-tree.sources.git_status"] then
                    require("neo-tree.sources.git_status").refresh()
                end
            end,
        })
    end,
}
