return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        -- Import necessary plugins
        local lspconfig = require("lspconfig")
        local blink_cmp = require("blink.cmp")
        -- Set up capabilities for autocompletion
        local capabilities = blink_cmp.get_lsp_capabilities()
        lspconfig.csharp_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.ts_ls.setup({
            capabilities = capabilities,
        })
        lspconfig.gopls.setup({
            capabilities = capabilities
        })

        -- Customize Diagnostic symbols in the sign column
        local signs = { Error = " ", Warn = " ", Hint = "💡", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end
    end,
}
