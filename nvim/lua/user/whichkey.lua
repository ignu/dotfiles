local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local horizontalLayout =
	'{ layout_strategy = "vertical", layout_config = { width = 0.95, height = 0.95, preview_height = { 0.7, min = 10 } } }'

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			--z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 6,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 60, max = 180 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
		n = { "s", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
	["b"] = {
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Buffers",
	},
	-- nnoremap <silent> <Leader>r :Bclose<CR>
	["e"] = { "<cmd>NvimTreeFindFileToggle<cr>", "Explorer" },
	["N"] = { ":set relativenumber!<CR>", "Toggle Nums" },
	["n"] = { ":set number!<CR>", "Toggle Rel" },
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
	["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["!"] = { ':w!<cr>:source %<cr>:echo "🚀sourced "<cr>', "Source" },
	["-"] = {
		[[
               :w!<cr>:source ~/.config/nvim/init.lua<CR>
               :w!<cr>:source ~/.config/nvim/lua/user/keymaps.lua<CR>
               :w!<cr>:source ~/.config/nvim/lua/user/whichkey.lua<CR>
               :echo "👾RELOADED VIM SETTNINGS"<cr>
            ]],
		"Reload VIM init.lua",
	},

	["j"] = {
		--"<cmd>lua vim.diagnostic.goto_next()<cr><cmd>lua vim.lsp.buf.code_action()<cr>",
		"<cmd>lua vim.diagnostic.goto_next()<cr><cmd>LspUI code_action<cr>",
		"Next Diagnostic",
	},
	["J"] = {
		--"<cmd>lua vim.diagnostic.goto_next()<cr><cmd>lua vim.lsp.buf.code_action()<cr>",
		"<cmd>lua vim.diagnostic.goto_next()<cr><cmd>lua vim.diagnostic.open_float()<cr>",
		"Popup Next Diagnostic",
	},
	["k"] = {
		"<cmd>lua vim.diagnostic.goto_prev()<cr><cmd>LspUI code_action<cr>",
		"Prev Diagnostic",
	},
	--["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
	--g = {},
	G = {
		name = "Git",
		--g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		--j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		--k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		b = { "<cmd>lua require 'gitsigns'.blame_line() full=true<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		h = { ":DiffviewFileHistory %<cr>", "File history" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		G = {
			":LazyGit<cr>",
			"Lazy Git",
		},
		o = {
			"<cmd>Telescope git_status(" .. horizontalLayout .. ")}), <cr>",
			"Open changed file",
		},
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		B = { "<cmd>Telescope git_branches theme=ivy<cr>", "Checkout branch" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
		D = {
			"<cmd>Gitsigns toggle_deleted<cr>",
			"Diff",
		},

		w = {
			":echo \"getting url\"<CR><cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>",
			"Github url",
		},
	},
	l = {
		name = "LSP",
		a = { "<cmd>LspUI code_action<cr>", "Code Action" },
		b = { "<cmd>:lua require('nvim-navbuddy').open()<CR>", "Nav (B)uddy" },
		c = { "<cmd>Telescope lsp_incoming_calls<CR>", "Incoming (C)alls" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		K = {
			--":lua vim.lsp.buf.hover()<cr>",
			":LspUI hover<cr>",
			"Hover Doc",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
		i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto implementation" },
		--[[ Z = { ]]
		--[[ 	'<cmd>lua vim.lsp.buf.execute_command({command = "_typescript.organizeImports", arguments = {vim.fn.expand("%:p")}})<CR>', ]]
		--[[ }, ]]
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		L = { '<cmd>:lua require("lsp_lines").toggle()<CR>', "Toggle lsp_lines" },
		--[[ L = { ':lua require("lsp_lines").toggle()<CR>', "Toggle Lua Lines" }, ]]

		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },

		--r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		r = { "<cmd>LspUI rename<cr>", "Rename" },
		R = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
		t = { ":Telescope lsp_references<CR>", "Telescope references" },
		w = { "<cmd>LspUI peek_definition<CR>", "peek def" },
		W = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		y = { "<cmd>LspInfo<cr>", "LSP Info" },
		Y = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
	},
	f = {
		name = "Telescope", -- find
		a = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Search In Buffer" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		J = { "<cmd>Telescope jumplist<cr>", "Jumplist" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		m = { "<cmd>Telescope marks<cr>", "Marks" },
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		O = { "<cmd>Telescope vim_options<cr>", "Options" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		--f = { "<cmd>Telescope live_grep<cr>", "Rg" }, mapped in keymaps now
		G = { "<cmd>Telescope lazygit<cr>", "Lazygit" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
		w = { "<cmd>:Rg <cword><CR>", "Search for word" },
		-- search for word in file's directory
		W = { "<cmd>:Rg <cword> %:p:h<CR>", "Search for word in file's directory" },
		t = { "<cmd>Telescope<cr>", "Telescopes" },
		T = { "<cmd>Telescope tagstack<cr>", "tagstack" },
		y = { "<cmd>Telescope resume<cr>", "Resume" },
		--[[ y = { "<cmd>Telescope yankhistory<cr>", "Yank History" }, ]]
	},
	--[[ s = { ]]
	--[[ 	name = "Sandwich", ]]
	--[[ 	D = { ]]
	--[[ 		"<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)", ]]
	--[[ 		"Delete", ]]
	--[[ 	}, ]]
	--[[ 	d = { ]]
	--[[ 		"<Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)", ]]
	--[[ 		"Delete named char", ]]
	--[[ 	}, ]]
	--[[ 	a = { "<Plug>(operator-sandwich-add)", "Add" }, ]]
	--[[ 	C = { ]]
	--[[ 		"<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)", ]]
	--[[ 		"Change named char", ]]
	--[[ 	}, ]]
	--[[ 	c = { ]]
	--[[ 		"<Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)", ]]
	--[[ 		"Change", ]]
	--[[ 	}, ]]
	--[[ 	s = { ]]
	--[[ 		"<Plug>(textobj-sandwich-auto-i)", ]]
	--[[ 		"Select inside", ]]
	--[[ 	}, ]]
	--[[ 	S = { ]]
	--[[ 		"<Plug>(textobj-sandwich-auto-a)", ]]
	--[[ 		"Select outside", ]]
	--[[ 	}, ]]
	--[[ }, ]]
	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
	X = {
		name = "Window",
		j = { "<cmd>:resize -8<CR>", "shorter" },
		k = { "<cmd>:resize +8<CR>", "taller" },
		h = { "<cmd>:vertical resize +8<CR>", "wider" },
		l = { "<cmd>:vertical resize -8<CR>", "shorter" },
		J = { "<cmd>:resize -18<CR>", "way shorter" },
		K = { "<cmd>:resize +18<CR>", "way taller" },
		H = { "<cmd>:vertical resize +18<CR>", "way wider" },
		L = { "<cmd>:vertical resize -8<CR>", "way Shorter" },
		y = { '<cmd>:"+y', "copy to clipboard" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
