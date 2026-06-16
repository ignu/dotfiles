local M = {}

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text redunant with lsp_lines
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = false,
		underline = true,
		severity_sort = true,
		float = {
			source = false,
			focusable = false,
			style = "minimal",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/hover"] = function(err, result, ctx, config)
		return vim.lsp.handlers.hover(err, result, ctx, vim.tbl_extend("force", { border = "rounded" }, config or {}))
	end

	vim.lsp.handlers["textDocument/signatureHelp"] = function(err, result, ctx, config)
		return vim.lsp.handlers.signature_help(err, result, ctx, vim.tbl_extend("force", { border = "rounded" }, config or {}))
	end
end

local function lsp_highlight_document(client, bufnr)
	if client.server_capabilities.document_highlight then
		local group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
		vim.api.nvim_clear_autocmds({ group = group, buffer = bufnr })
		vim.api.nvim_create_autocmd("CursorHold", {
			group = group,
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = group,
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(
		bufnr,
		"n",
		"gl",
		'<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<CR>',
		opts
	)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
	vim.cmd([[ command! Format execute 'lua vim.lsp.buf.format()' ]])
end

M.on_attach = function(client, bufnr)
	if client.name == "ts_ls" then
		--client.server_capabilities.document_formatting = false
		client.server_capabilities.documentFormattingProvider = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client, bufnr)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
