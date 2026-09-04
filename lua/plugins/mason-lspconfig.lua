return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = { "luau_lsp" },
            },
        },
        config = function(_, opts)
            require("mason-lspconfig").setup(opts)
        end,
    },
}
