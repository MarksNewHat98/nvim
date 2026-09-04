return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup({})
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter").setup({})
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function(_, opts)
            if opts.servers and opts.servers["*"] then
                vim.lsp.config("*", opts.servers["*"])
            end
        end,
    },
    {
        "akinsho/bufferline.nvim",
        config = function()
            require("bufferline").setup({})
        end,
    },
    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup({})
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
        config = function()
            require("lualine").setup({})
        end,
    },
    {
        "folke/tokyonight.nvim",
        config = function()
            require("tokyonight").setup({})
        end,
    },
    {
        "folke/flash.nvim",
        config = function()
            require("flash").setup({})
        end,
    },
    {
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    },
    --[[{
        "catppuccin/nvim",
        config = function()
            require("catppuccin").setup({})
        end,
    },--]]
    {
        "stevearc/conform.nvim",
        config = function()
            require("conform").setup({})
        end,
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("nvim-lint").setup({})
        end,
    },
    {
        "folke/persistence.nvim",
        event = "BufReadPre",
        opts = {},
        -- stylua: ignore
        keys = {
            { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
            { "<leader>qS", function() require("persistence").select() end,desc = "Select Session" },
            { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
            { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
        },
    },
}
