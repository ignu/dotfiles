local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- format async
_G.formatting_async = function(bufnr)
	bufnr = tonumber(bufnr) or vim.api.nvim_get_current_buf()

	vim.lsp.buf_request(
		bufnr,
		"textDocument/formatting",
		{ textDocument = { uri = vim.uri_from_bufnr(bufnr) } },
		function(err, res)
			if err then
				local err_msg = type(err) == "string" and err or err.message
				-- you can modify the log message / level (or ignore it completely)
				vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
				return
			end

			-- don't apply results if buffer is unloaded or has been modified
			if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
				return
			end

			if res then
				vim.lsp.util.apply_text_edits(res, bufnr, "utf8")
				vim.api.nvim_buf_call(bufnr, function()
					vim.cmd("silent noautocmd update")
				end)
			end
		end
	)
end

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier,
		formatting.black.with({ extra_args = { "--fast" } }),
		formatting.stylua,
		-- diagnostics.flake8
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- wrap in an augroup to prevent duplicate autocmds
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePost <buffer> lua formatting_async(vim.fn.expand("<abuf>"))
            augroup END
            ]])
		end
	end,
})
