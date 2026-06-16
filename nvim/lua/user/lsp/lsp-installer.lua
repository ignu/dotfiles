require("mason").setup()
require("mason-lspconfig").setup()
require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "eslint" },
})

local handlers = require("user.lsp.handlers")

vim.lsp.config("*", {
	on_attach = handlers.on_attach,
	capabilities = handlers.capabilities,
})

vim.lsp.config("ts_ls", {
	settings = {
		javascript = {
			importModuleSpecifierPreference = "relative",
		},
		typescript = {
			importModuleSpecifierPreference = "relative",
		},
	},
})

vim.lsp.enable({ "lua_ls", "ts_ls", "eslint" })
