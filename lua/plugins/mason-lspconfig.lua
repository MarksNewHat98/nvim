return {
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            automatic_enable = {
                exclude = { "luau_lsp" },
            },
        },
        config = function()
            require("mason-lspconfig").setup({})
        end,
    },
}
