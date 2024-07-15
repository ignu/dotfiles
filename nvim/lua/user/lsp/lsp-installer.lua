require("mason").setup()
require("mason-lspconfig").setup()
require("mason-null-ls").setup({
	ensure_installed = { "stylua", "jq", "eslint" },
})

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup({})
require("lspconfig").tsserver.setup({
	settings = {
		importModuleSpecifierPreference = "relative",
		javascript = {
			importModuleSpecifierPreference = "relative",

			--[[ inlayHints = { ]]
			--[[ 	includeInlayEnumMemberValueHints = true, ]]
			--[[ 	includeInlayFunctionLikeReturnTypeHints = true, ]]
			--[[ 	includeInlayFunctionParameterTypeHints = true, ]]
			--[[ 	includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'; ]]
			--[[ 	includeInlayParameterNameHintsWhenArgumentMatchesName = true, ]]
			--[[ 	includeInlayPropertyDeclarationTypeHints = true, ]]
			--[[ 	includeInlayVariableTypeHints = true, ]]
			--[[ }, ]]
		},
		typescript = {
			importModuleSpecifierPreference = "relative",
			--[[ inlayHints = { ]]
			--[[ 	includeInlayEnumMemberValueHints = true, ]]
			--[[ 	includeInlayFunctionLikeReturnTypeHints = true, ]]
			--[[ 	includeInlayFunctionParameterTypeHints = true, ]]
			--[[ 	includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all'; ]]
			--[[ 	includeInlayParameterNameHintsWhenArgumentMatchesName = true, ]]
			--[[ 	includeInlayPropertyDeclarationTypeHints = true, ]]
			--[[ 	includeInlayVariableTypeHints = true, ]]
			--[[ }, ]]
		},
	},
})
require("lspconfig").eslint.setup({})
--require("lspconfig")["null-ls"].setup({})

-- require("lspconfig").rust_analyzer.setup {}
-- ...
