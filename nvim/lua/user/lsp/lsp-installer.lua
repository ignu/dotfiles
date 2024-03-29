require("mason").setup()
require("mason-lspconfig").setup()
require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "eslint" },
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup({})
require("lspconfig").tsserver.setup({
	importModuleSpecifierPreference = "relative",
})
require("lspconfig").eslint.setup({})
--require("lspconfig")["null-ls"].setup({})

-- require("lspconfig").rust_analyzer.setup {}
-- ...
