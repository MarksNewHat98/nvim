local path = nil

return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                hidden = true,
                sources = {
                    files = {
                        hidden = true, -- Show hidden/dotfiles
                        ignored = true,
                    },
                },
            },
            explorer = { },
        },
        keys = {
            { "<leader>e", function() Snacks.explorer({ cwd = path }) end, desc = "Explorer Snacks (cwd)" },
            { "<leader>Ec", function() path = nil end, desc = "Reset Explorer Path" },
            { "<leader>En", function() path = Snacks.picker.get({ source = "explorer" })[1]:dir() end, desc = "Set Explorer Path" },
            { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
            -- find
            { "<leader>fB", function() Snacks.picker.buffers({ hidden = true, nofile = true }) end, desc = "Buffers (all)" },
            { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Files (git-files)" },
            { "<leader>fr", function() Snacks.picker.recent({ filter = { cwd = true }}) end, desc = "Recent (cwd)" },
            { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
            -- Grep
            { "<leader>sb", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
            { "<leader>sB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
            { "<leader>sp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
            -- search
            { '<leader>s"', function() Snacks.picker.registers() end, desc = "Registers" },
            { '<leader>s/', function() Snacks.picker.search_history() end, desc = "Search History" },
            { "<leader>sa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
            { "<leader>sC", function() Snacks.picker.commands() end, desc = "Commands" },
            { "<leader>sd", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
            { "<leader>sD", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
            { "<leader>sh", function() Snacks.picker.help() end, desc = "Help Pages" },
            { "<leader>sH", function() Snacks.picker.highlights() end, desc = "Highlights" },
            { "<leader>si", function() Snacks.picker.icons() end, desc = "Icons" },
            { "<leader>sj", function() Snacks.picker.jumps() end, desc = "Jumps" },
            { "<leader>sk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
            { "<leader>sM", function() Snacks.picker.man() end, desc = "Man Pages" },
            { "<leader>sm", function() Snacks.picker.marks() end, desc = "Marks" },
            { "<leader>su", function() Snacks.picker.undo() end, desc = "Undotree" },
        },
        config = function()
            require("snacks").setup(opts)
        end,
    },
}
