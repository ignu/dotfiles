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
	prefix = "",
	disable_ft = { "markdown" },
	disable_virtual_lines = true,
	disable_virtual_lines_ft = { "yaml" },
	min_rows = 7,
	-- Same as above but only for spesific filetypes
	-- Default: {}
	--min_rows_ft = {},
})

local signature_cfg = {
	debug = false, -- set to true to enable debug logging
	log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
	-- default is  ~/.cache/nvim/lsp_signature.log
	verbose = false, -- show debug line number

	bind = true, -- This is mandatory, otherwise border config won't get registered.
	-- If you want to hook lspsaga or other signature handler, pls set to false
	doc_lines = 12, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
	-- set to 0 if you DO NOT want any API comments be shown
	-- This setting only take effect in insert mode, it does not affect signature help in normal
	-- mode, 10 by default

	max_height = 45, -- max height of signature floating_window
	max_width = 390, -- max_width of signature floating_window
	noice = false, -- set to true if you using noice to render markdown
	wrap = true, -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long

	floating_window = false, -- show hint in a floating window, set to false for virtual text only mode

	floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
	-- will set to true when fully tested, set to false will use whichever side has more space
	-- this setting will be helpful if you do not want the PUM and floating win overlap

	floating_window_off_x = 1, -- adjust float windows x position.
	-- can be either a number or function
	floating_window_off_y = -1, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
	-- can be either number or function, see examples

	close_timeout = 4000, -- close floating window after ms when laster parameter is entered
	fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
	hint_enable = true, -- virtual hint enable
	hint_prefix = "📖 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
	hint_scheme = "String",
	hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
	handler_opts = {
		border = "rounded", -- double, rounded, single, shadow, none, or a table of borders
	},

	always_trigger = true, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

	auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
	extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
	zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

	padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc

	transparency = 50, -- disabled by default, allow floating win transparent value 1~100
	shadow_blend = 36, -- if you using shadow as border use this set the opacity
	shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
	timer_interval = 50, -- default timer check interval set to lower value if you want to reduce latency
	toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'

	select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
	move_cursor_key = nil, -- imap, use nvim_set_current_win to move cursor between current win and floating
}

require("lsp_signature").setup(signature_cfg)

--require("lsp_lines").setup()

-- Default config
require("LspUI").setup({
	prompt = false,
	lightbulb = {
		enable = false, -- close by default
		command_enable = false, -- close by default, this switch does not have to be turned on, this command has no effect
		icon = "💡",
	},
	code_action = {
		enable = true,
		command_enable = true,
		icon = "💡",
		keybind = {
			exec = "<CR>",
			prev = "k",
			next = "j",
			quit = "q",
		},
	},
	hover = {
		enable = true,
		command_enable = true,
		keybind = {
			prev = "p",
			next = "n",
			quit = "q",
		},
	},
	rename = {
		enable = true,
		command_enable = true,
		auto_select = true, -- whether select all automatically
		keybind = {
			change = "<CR>",
			quit = "<ESC>",
		},
	},
	diagnostic = {
		enable = false,
		command_enable = true,
		icons = {
			Error = " ",
			Warn = " ",
			Info = " ",
			Hint = " ",
		},
	},
	peek_definition = {
		enable = true, -- close by default
		command_enable = true,
		keybind = {
			edit = "op",
			vsplit = "ov",
			split = "os",
			quit = "q",
		},
	},
})

local M = {}

local enabled = true

function M.setup()
	vim.diagnostic.config({ virtual_text = true })
	--[[ require("lsp_lines").setup() ]]

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
