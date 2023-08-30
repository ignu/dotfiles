require("mason").setup()
require("mason-lspconfig").setup()

-- After setting up mason-lspconfig you may set up servers via lspconfig
require("lspconfig").lua_ls.setup {}
require("lspconfig").tsserver.setup {}
require("lspconfig").eslint.setup {}

-- require("lspconfig").rust_analyzer.setup {}
-- ...
