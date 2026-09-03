return {
    {
        "folke/snacks.nvim",
        opts = {
            picker = {
                hidden = true,
                sources = {
                files = {
                    hidden = true, -- Show hidden/dotfiles
                },
                },
            },
        },
        config = function()
            require("snacks").setup(opts)
        end,
    },
}
