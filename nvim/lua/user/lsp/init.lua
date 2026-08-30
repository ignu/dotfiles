-- local status_ok, lspconfig = pcall(require, "lspconfig")
-- if not status_ok then
-- 	return
-- end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("fidget").setup({})
require("lsp_lines").setup()
-- local navic = require("nvim-navic")

-- lspconfig.clangd.setup({
-- 	on_attach = function(client, bufnr)
-- 		navic.attach(client, bufnr)
-- 	end,
-- })

require("nvim_context_vt").setup({
	enabled = true,
	prefix = "",
	disable_ft = { "markdown" },
	disable_virtual_lines = true,
	disable_virtual_lines_ft = { "yaml" },
	min_rows = 7,
})

local signature_cfg = {
	debug = false,
	log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
	verbose = false,

	bind = true,
	doc_lines = 12,

	max_height = 45,
	max_width = 390,
	noice = false,
	wrap = true,

	floating_window = false,

	floating_window_above_cur_line = true,

	floating_window_off_x = 1,
	floating_window_off_y = -1,

	close_timeout = 4000,
	fix_pos = false,
	hint_enable = true,
	hint_prefix = "📖 ",
	hint_scheme = "String",
	hi_parameter = "LspSignatureActiveParameter",
	handler_opts = {
		border = "rounded",
	},

	always_trigger = true,

	auto_close_after = nil,
	extra_trigger_chars = {},
	zindex = 200,

	padding = "",

	transparency = 50,
	shadow_blend = 36,
	shadow_guibg = "Black",
	timer_interval = 50,
	toggle_key = nil,

	select_signature_key = nil,
	move_cursor_key = nil,
}

require("lsp_signature").setup(signature_cfg)

local M = {}

local enabled = true

function M.setup()
	vim.diagnostic.config({ virtual_text = true })

	vim.keymap.set("n", "<Leader>le", function()
		enabled = not enabled
		if enabled == true then
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					source = false,
				},
			})
		else
			vim.diagnostic.config({
				virtual_text = true,
			})
		end
		require("lsp_lines").toggle()
	end, {
		desc = "Toggle lsp_lines",
	})
end

return M
