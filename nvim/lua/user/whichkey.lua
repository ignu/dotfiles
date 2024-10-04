local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local horizontalLayout =
	'{ layout_strategy = "vertical", layout_config = { width = 0.95, height = 0.95, preview_height = { 0.7, min = 10 } } }'

local defaults = {
	---@type false | "classic" | "modern" | "helix"
	preset = "classic",
	-- Delay before showing the popup. Can be a number or a function that returns a number.
	---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
	delay = function(ctx)
		return ctx.plugin and 0 or 200
	end,
	filter = function(mapping)
		-- example to exclude mappings without a description
		-- return mapping.desc and mapping.desc ~= ""
		return true
	end,
	spec = {},
	-- show a warning when issues were detected with your mappings
	notify = true,
	-- Which-key automatically sets up triggers for your mappings.
	-- But you can disable this and setup the triggers manually.
	-- Check the docs for more info.
	triggers = {
		{ "<auto>", mode = "nxsot" },
	},
	-- Start hidden and wait for a key to be pressed before showing the popup
	-- Only used by enabled xo mapping modes.
	---@param ctx { mode: string, operator: string }
	defer = function(ctx)
		return ctx.mode == "V" or ctx.mode == "<C-V>"
	end,
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		presets = {
			operators = true, -- adds help for operators like d, y, ...
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	win = {
		-- don't allow the popup to overlap with the cursor
		no_overlap = true,
		-- width = 1,
		-- height = { min = 4, max = 25 },
		-- col = 0,
		-- row = math.huge,
		-- border = "none",
		padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
		title = true,
		title_pos = "center",
		zindex = 1000,
		-- Additional vim.wo and vim.bo options
		bo = {},
		wo = {
			-- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
		},
	},
	layout = {
		width = { min = 20 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
	},
	keys = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	--- Mappings are sorted using configured sorters and natural sort of the keys
	--- Available sorters:
	--- * local: buffer-local mappings first
	--- * order: order of the items (Used by plugins like marks / registers)
	--- * group: groups last
	--- * alphanum: alpha-numerical first
	--- * mod: special modifier keys last
	--- * manual: the order the mappings were added
	--- * case: lower-case first
	sort = { "local", "order", "group", "alphanum", "mod" },
	expand = 0, -- expand groups when <= n mappings
	-- expand = function(node)
	--   return not node.desc -- expand all nodes without a description
	-- end,
	-- Functions/Lua Patterns for formatting the labels
	---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
	replace = {
		key = {
			function(key)
				return require("which-key.view").format(key)
			end,
			-- { "<Space>", "SPC" },
		},
		desc = {
			{ "<Plug>%(?(.*)%)?", "%1" },
			{ "^%+", "" },
			{ "<[cC]md>", "" },
			{ "<[cC][rR]>", "" },
			{ "<[sS]ilent>", "" },
			{ "^lua%s+", "" },
			{ "^call%s+", "" },
			{ "^:%s*", "" },
		},
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
		ellipsis = "…",
		-- set to false to disable all mapping icons,
		-- both those explicitely added in a mapping
		-- and those from rules
		mappings = true,
		--- See `lua/which-key/icons.lua` for more details
		--- Set to `false` to disable keymap icons from rules
		rules = {},
		-- use the highlights from mini.icons
		-- When `false`, it will use `WhichKeyIcon` instead
		colors = true,
		-- used by key format
		keys = {
			Up = " ",
			Down = " ",
			Left = " ",
			Right = " ",
			C = "󰘴 ",
			M = "󰘵 ",
			D = "󰘳 ",
			S = "󰘶 ",
			CR = "󰌑 ",
			Esc = "󱊷 ",
			ScrollWheelDown = "󱕐 ",
			ScrollWheelUp = "󱕑 ",
			NL = "󰌑 ",
			BS = "󰁮",
			Space = "󱁐 ",
			Tab = "󰌒 ",
			F1 = "󱊫",
			F2 = "󱊬",
			F3 = "󱊭",
			F4 = "󱊮",
			F5 = "󱊯",
			F6 = "󱊰",
			F7 = "󱊱",
			F8 = "󱊲",
			F9 = "󱊳",
			F10 = "󱊴",
			F11 = "󱊵",
			F12 = "󱊶",
		},
	},
	show_help = true, -- show a help message in the command line for using WhichKey
	show_keys = true, -- show the currently pressed key and its label as a message in the command line
	-- disable WhichKey for certain buf types and file types.
	disable = {
		ft = {},
		bt = {},
	},
	debug = false, -- enable wk.log in the current directory
}

--[[ local opts = { ]]
--[[ 	mode = "n", -- NORMAL mode ]]
--[[ 	prefix = "<leader>", ]]
--[[ 	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings ]]
--[[ 	silent = true, -- use `silent` when creating keymaps ]]
--[[ 	noremap = true, -- use `noremap` when creating keymaps ]]
--[[ 	nowait = true, -- use `nowait` when creating keymaps ]]
--[[ } ]]

local mappings = {
	{ "<leader>b", group = "buffers" }, -- group
	{
		"<leader>bb",
		"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		desc = "Buffers",
		mode = "n",
	},
	{ "<leader>e", "<cmd>NvimTreeFindFileToggle<cr>", desc = "Explorer", mode = "n" },
	{ "<leader>N", ":set relativenumber!<CR>", desc = "Toggle Nums", mode = "n" },
	{ "<leader>n", ":set number!<CR>", desc = "Toggle Rel", mode = "n" },
	{ "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", mode = "n" },
	{ "<leader>F", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "Find Text", mode = "n" },
	{ "<leader>!", ':w!<cr>:source %<cr>:echo "🚀sourced "<cr>', desc = "Source", mode = "n" },
	{
		"<leader>-",
		[[
    :w!<cr>:source ~/.config/nvim/init.lua<CR>
    :w!<cr>:source ~/.config/nvim/lua/user/keymaps.lua<CR>
    :w!<cr>:source ~/.config/nvim/lua/user/whichkey.lua<CR>
    :echo "👾RELOADED VIM SETTNINGS"<cr>
  ]],
		desc = "Reload VIM init.lua",
		mode = "n",
	},
	{
		"<leader>j",
		"<cmd>lua vim.diagnostic.goto_next()<cr><cmd>LspUI code_action<cr>",
		desc = "Next Diagnostic",
		mode = "n",
	},
	{
		"<leader>J",
		"<cmd>lua vim.diagnostic.goto_next()<cr><cmd>lua vim.diagnostic.open_float()<cr>",
		desc = "Popup Next Diagnostic",
		mode = "n",
	},
	{
		"<leader>k",
		"<cmd>lua vim.diagnostic.goto_prev()<cr><cmd>LspUI code_action<cr>",
		desc = "Prev Diagnostic",
		mode = "n",
	},
	{ "<leader>G", group = "Git" }, -- group
	{
		"<leader>Gb",
		"<cmd>lua require 'gitsigns'.blame_line() full=true<cr>",
		desc = "Blame",
		mode = "n",
	},
	{
		"<leader>Gp",
		"<cmd>lua require 'gitsigns'.preview_hunk()<cr>",
		desc = "Preview Hunk",
		mode = "n",
	},
	{
		"<leader>Gr",
		"<cmd>lua require 'gitsigns'.reset_hunk()<cr>",
		desc = "Reset Hunk",
		mode = "n",
	},
	{
		"<leader>GR",
		"<cmd>lua require 'gitsigns'.reset_buffer()<cr>",
		desc = "Reset Buffer",
		mode = "n",
	},
	{
		"<leader>Gs",
		"<cmd>lua require 'gitsigns'.stage_hunk()<cr>",
		desc = "Stage Hunk",
		mode = "n",
	},
	{
		"<leader>Gh",
		":DiffviewFileHistory %<cr>",
		desc = "File history",
		mode = "n",
	},
	{
		"<leader>Gu",
		"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
		desc = "Undo Stage Hunk",
		mode = "n",
	},
	{
		"<leader>GG",
		":LazyGit<cr>",
		desc = "Lazy Git",
		mode = "n",
	},
	{
		"<leader>Go",
		"<cmd>Telescope git_status(" .. horizontalLayout .. ")}), <cr>",
		desc = "Open changed file",
		mode = "n",
	},
	{
		"<leader>Gc",
		"<cmd>Telescope git_commits<cr>",
		desc = "Checkout commit",
		mode = "n",
	},
	{
		"<leader>GB",
		"<cmd>Telescope git_branches theme=ivy<cr>",
		desc = "Checkout branch",
		mode = "n",
	},
	{
		"<leader>Gd",
		"<cmd>Gitsigns diffthis HEAD<cr>",
		desc = "Diff",
		mode = "n",
	},
	{
		"<leader>GD",
		"<cmd>Gitsigns toggle_deleted<cr>",
		desc = "Toggle Deleted",
		mode = "n",
	},
	{
		"<leader>Gw",
		":echo \"getting url\"<CR><cmd>lua require'gitlinker'.get_buf_range_url('n')<cr>",
		desc = "Github url",
		mode = "n",
	},
	{ "<leader>l", group = "LSP" }, -- group
	{
		"<leader>la",
		"<cmd>LspUI code_action<cr>",
		desc = "Code Action",
		mode = "n",
	},
	{
		"<leader>lb",
		"<cmd>:lua require('nvim-navbuddy').open()<CR>",
		desc = "Nav (B)uddy",
		mode = "n",
	},
	{
		"<leader>lc",
		"<cmd>Telescope lsp_incoming_calls<CR>",
		desc = "Incoming (C)alls",
		mode = "n",
	},
	{
		"<leader>ld",
		"<cmd> :lua vim.lsp.buf.definition()<CR>",
		desc = "Go to definition",
		mode = "n",
	},
	{
		"<leader>lK",
		":LspUI hover<cr>",
		desc = "Hover Doc",
		mode = "n",
	},
	{
		"<leader>lf",
		"<cmd>lua vim.lsp.buf.formatting()<cr>",
		desc = "Format",
		mode = "n",
	},
	{
		"<leader>lh",
		"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
		desc = "Toggle Inlay Hints",
		mode = "n",
	},
	{
		"<leader>lH",
		"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<CR>",
		desc = "Toggle Inlay Hints",
		mode = "n",
	},
	{
		"<leader>li",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		desc = "Goto implementation",
		mode = "n",
	},
	{
		"<leader>lj",
		"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
		desc = "Next Diagnostic",
		mode = "n",
	},
	{
		"<leader>lk",
		"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
		desc = "Prev Diagnostic",
		mode = "n",
	},
	{
		"<leader>ll",
		"<cmd>lua vim.lsp.codelens.run()<cr>",
		desc = "CodeLens Action",
		mode = "n",
	},
	{
		"<leader>lL",
		'<cmd>:lua require("lsp_lines").toggle()<CR>',
		desc = "Toggle lsp_lines",
		mode = "n",
	},
	{
		"<leader>lq",
		"<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>",
		desc = "Quickfix",
		mode = "n",
	},
	{
		"<leader>lr",
		"<cmd>LspUI rename<cr>",
		desc = "Rename",
		mode = "n",
	},
	{
		"<leader>lR",
		"<cmd>lua vim.lsp.buf.references()<cr>",
		desc = "Telescope References",
		mode = "n",
	},
	{
		"<leader>ls",
		"<cmd>Telescope lsp_document_symbols<cr>",
		desc = "Document Symbols",
		mode = "n",
	},
	{
		"<leader>lS",
		"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
		desc = "Workspace Symbols",
		mode = "n",
	},
	{
		"<leader>lt",
		":Telescope lsp_references<CR>",
		desc = "Telescope references",
		mode = "n",
	},
	{
		"<leader>lw",
		"<cmd>LspUI peek_definition<CR>",
		desc = "peek def",
		mode = "n",
	},
	{
		"<leader>lW",
		"<cmd>Telescope lsp_workspace_diagnostics<cr>",
		desc = "Workspace Diagnostics",
		mode = "n",
	},
	{
		"<leader>ly",
		"<cmd>LspInfo<cr>",
		desc = "LSP Info",
		mode = "n",
	},
	{
		"<leader>lY",
		"<cmd>LspInstallInfo<cr>",
		desc = "Installer Info",
		mode = "n",
	},
	{ "<leader>f", group = "Telescope" }, -- group
	{
		"<leader>fa",
		"<cmd>Telescope current_buffer_fuzzy_find<cr>",
		desc = "Search In Buffer",
		mode = "n",
	},
	{
		"<leader>fb",
		"<cmd>Telescope git_branches<cr>",
		desc = "Checkout branch",
		mode = "n",
	},
	{
		"<leader>fc",
		"<cmd>Telescope colorscheme<cr>",
		desc = "Colorscheme",
		mode = "n",
	},
	{
		"<leader>fJ",
		"<cmd>Telescope jumplist<cr>",
		desc = "Jumplist",
		mode = "n",
	},
	{
		"<leader>fh",
		"<cmd>Telescope help_tags<cr>",
		desc = "Find Help",
		mode = "n",
	},
	--[[ { ]]
	--[[   "<leader>fM", ]]
	--[[   "<cmd>Telescope man_pages<cr>", ]]
	--[[   desc = "Man Pages", ]]
	--[[   mode = "n", ]]
	--[[ }, ]]
	{
		"<leader>fm",
		"<cmd>Telescope marks<cr>",
		desc = "Marks",
		mode = "n",
	},
	{
		"<leader>fo",
		"<cmd>Telescope git_status<cr>",
		desc = "Open changed file",
		mode = "n",
	},
	{
		"<leader>fO",
		"<cmd>Telescope vim_options<cr>",
		desc = "Options",
		mode = "n",
	},
	{
		"<leader>fr",
		"<cmd>Telescope oldfiles<cr>",
		desc = "Open Recent File",
		mode = "n",
	},
	{
		"<leader>fG",
		"<cmd>Telescope lazygit<cr>",
		desc = "Lazygit",
		mode = "n",
	},
	{
		"<leader>fR",
		"<cmd>Telescope registers<cr>",
		desc = "Registers",
		mode = "n",
	},
	{
		"<leader>fk",
		"<cmd>Telescope keymaps<cr>",
		desc = "Keymaps",
		mode = "n",
	},
	{
		"<leader>fC",
		"<cmd>Telescope commands<cr>",
		desc = "Commands",
		mode = "n",
	},
	{
		"<leader>fw",
		"<cmd>:Rg <cword><CR>",
		desc = "Search for word",
		mode = "n",
	},
	{
		"<leader>fW",
		"<cmd>:Rg <cword> %:p:h<CR>",
		desc = "Search for word in file's directory",
		mode = "n",
	},
	{
		"<leader>ft",
		"<cmd>Telescope<cr>",
		desc = "Telescopes",
		mode = "n",
	},
	{
		"<leader>fT",
		"<cmd>Telescope tagstack<cr>",
		desc = "Tagstack",
		mode = "n",
	},
	{
		"<leader>fy",
		"<cmd>Telescope resume<cr>",
		desc = "Resume",
		mode = "n",
	},
	{ "<leader>t", group = "Terminal" }, -- group
	{
		"<leader>tn",
		"<cmd>lua _NODE_TOGGLE()<cr>",
		desc = "Node",
		mode = "n",
	},
	{
		"<leader>tt",
		"<cmd>lua _HTOP_TOGGLE()<cr>",
		desc = "Htop",
		mode = "n",
	},
	{
		"<leader>tf",
		"<cmd>ToggleTerm direction=float<cr>",
		desc = "Float",
		mode = "n",
	},
	{
		"<leader>th",
		"<cmd>ToggleTerm size=10 direction=horizontal<cr>",
		desc = "Horizontal",
		mode = "n",
	},
	{
		"<leader>tv",
		"<cmd>ToggleTerm size=80 direction=vertical<cr>",
		desc = "Vertical",
		mode = "n",
	},
	{ "<leader>X", group = "Window" }, -- group
	{
		"<leader>Xj",
		"<cmd>:resize -8<CR>",
		desc = "shorter",
		mode = "n",
	},
	{
		"<leader>Xk",
		"<cmd>:resize +8<CR>",
		desc = "taller",
		mode = "n",
	},
	{
		"<leader>Xh",
		"<cmd>:vertical resize +8<CR>",
		desc = "wider",
		mode = "n",
	},
	{
		"<leader>Xl",
		"<cmd>:vertical resize -8<CR>",
		desc = "shorter",
		mode = "n",
	},
	{
		"<leader>XJ",
		"<cmd>:resize -18<CR>",
		desc = "way shorter",
		mode = "n",
	},
	{
		"<leader>XK",
		"<cmd>:resize +18<CR>",
		desc = "way taller",
		mode = "n",
	},
	{
		"<leader>XH",
		"<cmd>:vertical resize +18<CR>",
		desc = "way wider",
		mode = "n",
	},
	{
		"<leader>XL",
		"<cmd>:vertical resize -8<CR>",
		desc = "way Shorter",
		mode = "n",
	},
	{
		"<leader>Xy",
		'<cmd>:"+y',
		desc = "copy to clipboard",
		mode = "n",
	},
}

which_key.setup(defaults)
which_key.add(mappings)
