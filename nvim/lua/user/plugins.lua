local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.g.skip_ts_context_commentstring_module = true

if not vim.loop.fs_stat(lazypath) then
	fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
	vim.notify("Could not load packer", vim.o.error_bell)
	return
end

-- example using a list of specs with the default options
vim.g.mapleader = " " -- make sure to set `mapleader` before lazy so your mappings are correct

local plugins = {
	"tpope/vim-surround",
	--"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	--"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	--"akinsho/bufferline.nvim",

	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"numToStr/Comment.nvim", -- Easily comment stuff
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	--use("akinsho/toggleterm.nvim")
	"ahmedkhalf/project.nvim",
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},

	-------------------
	-- 🎨 Colorschemes
	-------------------
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	--use("shaunsingh/oxocarbon.nvim")
	--use("Yazeed1s/minimal.nvim")
	--use("adisen99/codeschool.nvim")
	--use("tjdevries/colorbuddy.nvim")
	--use("lunarvim/darkplus.nvim")
	"rockerBOO/boo-colorscheme-nvim",
	{
		"zootedb0t/citruszest.nvim",
		lazy = false,
		priority = 1000,
	},
	"rebelot/kanagawa.nvim",
	"gruvbox-community/gruvbox",
	"sainnhe/everforest",
	"savq/melange",
	"EdenEast/nightfox.nvim",
	"folke/tokyonight.nvim",
	"arturgoms/moonbow.nvim",
	"bluz71/vim-moonfly-colors",
	"dasupradyumna/midnight.nvim",

	-- remember last color
	--{ "rojspencer/vim-colorminder", event = "VeryLazy" },
	{ "rojspencer/vim-colorminder" }, -- remember last colorscheme

	-- cmp plugins
	"hrsh7th/nvim-cmp", -- The completion plugin
	"hrsh7th/cmp-buffer", -- buffer completions
	"hrsh7th/cmp-path", -- path completions
	"hrsh7th/cmp-cmdline", -- cmdline completions
	"saadparwaiz1/cmp_luasnip", -- snippet completions
	"hrsh7th/cmp-nvim-lsp",

	{
		"stevearc/aerial.nvim",
		config = function()
			require("aerial").setup({
				on_attach = function(bufnr)
					-- Jump forwards/backwards with '{' and '}'
					vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
					vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
				end,
			})
		end,
	},
	"AndrewRadev/tagalong.vim", --rename both pairs of html

	--use("simrat39/symbols-outline.nvim")
	-- ----------------
	-- ✂️ Snippets
	-- ----------------
	"dcampos/nvim-snippy",
	"dcampos/cmp-snippy",
	"ignu/vim-snippets",

	-- ---	-- ------
	-- 🔊 LSP
	-- ---	-- -------
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"jay-babu/mason-null-ls.nvim",
	"neovim/nvim-lspconfig", -- enable LSP
	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"nvimtools/none-ls.nvim", -- community-maintained null-ls fork
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- full lines of diagnostics

	"folke/trouble.nvim", -- for troubleshooting
	"haringsrob/nvim_context_vt", -- see method vt
	{
		"ojroques/nvim-lspfuzzy",
		dependencies = {
			{ "junegunn/fzf" },
			{ "junegunn/fzf.vim" }, -- to enable preview (optional)
		},
	},
	{
		"ray-x/lsp_signature.nvim",
	},
	{
		"SmiteshP/nvim-navic",
	},
	{
		"MunifTanjim/nui.nvim",
	},

	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"lewis6991/async.nvim",
		},
		config = function()
			require("refactoring").setup()
		end,
	},
	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"neovim/nvim-lspconfig",
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
	},
	"HiPhish/rainbow-delimiters.nvim",

	-- ------	-- ------
	-- ☕️ TypeScript
	-- -----	-- -------

	"dmmulroy/tsc.nvim",

	-- ------	-- ------
	-- 💻 DAP
	-- -----	-- -------
	"mfussenegger/nvim-dap",
	"nvim-telescope/telescope-dap.nvim",
	"mxsdev/nvim-dap-vscode-js",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",

	-- ------

	{ "kevinhwang91/nvim-bqf", ft = "qf" },

	-- -----	-- -------
	-- 🔭 Telescope
	-- -----	-- -------

	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ --pass in options to rg
		"nvim-telescope/telescope.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	},
	{
		"nvim-telescope/telescope-node-modules.nvim",
		config = function()
			require("telescope").load_extension("node_modules")
		end,
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		keys = {
			{
				"<leader>fB",
				":Telescope file_browser path=%:p:h=%:p:h<cr>",
				desc = "Browse Files",
			},
		},
		config = function()
			require("telescope").load_extension("file_browser")
		end,
	},
	"stevearc/oil.nvim", -- nvim file explorer
	{
		"sudormrfbin/cheatsheet.nvim",

		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
	},
	{
		"klen/nvim-config-local",
		config = function()
			require("config-local").setup({
				-- Default configuration (optional)
				config_files = { ".vimrc.lua", ".vimrc" }, -- Config file patterns to load (lua supported)
				hashfile = vim.fn.stdpath("data") .. "/config-local", -- Where the plugin keeps files data
				autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
				commands_create = true, -- Create commands (ConfigSource, ConfigEdit, ConfigTrust, ConfigIgnore)
				silent = true, -- Disable plugin messages (Config loaded/ignored)
				lookup_parents = false, -- Lookup config files in parent directories
			})
		end,
	},
	"duane9/nvim-rg",
	-- ----------
	-- 🌲 Treesitter
	-- ----------
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"hashivim/vim-terraform",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"nvim-treesitter/nvim-treesitter-context",
	"mfussenegger/nvim-treehopper", -- select and navigate
	{
		"Kasama/nvim-custom-diagnostic-highlight",
		config = function()
			require("nvim-custom-diagnostic-highlight").setup({})
		end,
	},

	-- ----------
	-- 📓 Git
	-- ----------
	"lewis6991/gitsigns.nvim",
	"tveskag/nvim-blame-line",
	--use("TimUntersberger/neogit")
	{ "sindrets/diffview.nvim", dependencies = "nvim-lua/plenary.nvim", event = "VeryLazy" },

	"ojroques/vim-oscyank",
	"ruifm/gitlinker.nvim",

	-- modern YankRing
	{
		"gbprod/yanky.nvim",
		event = "VeryLazy",
		config = function()
			require("yanky").setup({})
		end,
	},
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			-- Only one of these is needed.
			"esmuellert/codediff.nvim", -- optional

			-- For a custom log pager
			"m00qek/baleia.nvim", -- optional

			-- Only one of these is needed.
			"nvim-telescope/telescope.nvim", -- optional
		},
		cmd = "Neogit",
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
		},
	},

	{
		"esmuellert/codediff.nvim",
		cmd = "CodeDiff",
		opts = {
			-- Highlight configuration
			highlights = {
				-- Line-level: accepts highlight group names or hex colors (e.g., "#2ea043")
				line_insert = "DiffAdd", -- Line-level insertions
				line_delete = "DiffDelete", -- Line-level deletions

				-- Character-level: accepts highlight group names or hex colors
				-- If specified, these override char_brightness calculation
				char_insert = nil, -- Character-level insertions (nil = auto-derive)
				char_delete = nil, -- Character-level deletions (nil = auto-derive)

				-- Brightness multiplier (only used when char_insert/char_delete are nil)
				-- nil = auto-detect based on background (1.4 for dark, 0.92 for light)
				char_brightness = nil, -- Auto-adjust based on your colorscheme

				-- Conflict sign highlights (for merge conflict views)
				-- Accepts highlight group names or hex colors (e.g., "#f0883e")
				-- nil = use default fallback chain
				conflict_sign = nil, -- Unresolved: DiagnosticSignWarn -> #f0883e
				conflict_sign_resolved = nil, -- Resolved: Comment -> #6e7681
				conflict_sign_accepted = nil, -- Accepted: GitSignsAdd -> DiagnosticSignOk -> #3fb950
				conflict_sign_rejected = nil, -- Rejected: GitSignsDelete -> DiagnosticSignError -> #f85149
			},

			-- Diff view behavior
			diff = {
				layout = "side-by-side", -- Diff layout: "side-by-side" (two panes) or "inline" (single pane with virtual lines)
				filler_text = "╱", -- Repeated filler pattern; use "" for blank alignment rows
				disable_inlay_hints = true, -- Disable inlay hints in diff windows for cleaner view
				max_computation_time_ms = 5000, -- Maximum time for diff computation (VSCode default)
				ignore_trim_whitespace = false, -- Ignore leading/trailing whitespace changes (like diffopt+=iwhite)
				hide_merge_artifacts = false, -- Hide merge tool temp files (*.orig, *.BACKUP.*, *.BASE.*, *.LOCAL.*, *.REMOTE.*)
				original_position = "left", -- Position of original (old) content: "left" or "right"
				conflict_ours_position = "right", -- Position of ours (:2) in conflict view: "left" or "right"
				conflict_result_position = "bottom", -- "bottom" (default): result below diff panes or "center": result between diff panes (three columns)
				conflict_result_height = 30, -- Height of result pane in bottom layout (% of total height)
				conflict_result_width_ratio = { 1, 1, 1 }, -- Width ratio for center layout panes {left, center, right} (e.g., {1, 2, 1} for wider result)
				cycle_next_hunk = true, -- Wrap around when navigating hunks (]c/[c): false to stop at first/last
				cycle_next_file = true, -- Wrap around when navigating files (]f/[f): false to stop at first/last
				cycle_hunks_across_files = false, -- ]c/[c at file boundary hops to first/last hunk of next/prev file (explorer/history)
				jump_to_first_change = true, -- Auto-scroll to first change when opening a diff: false to stay at same line
				highlight_added_deleted_files = false, -- Tint full contents of added, untracked, and deleted files
				highlight_priority = 100, -- Priority for line-level diff highlights (increase to override LSP highlights)
				gutter_signs = false, -- Gutter +/- signs; see Gutter signs below
				compute_moves = false, -- Detect moved code blocks (opt-in, matches VSCode experimental.showMoves)
				compact_context_lines = 3, -- Number of context lines around hunks in compact mode
				compact_sync_folds = true, -- Sync fold open/close across panes (mirrors Vim diff mode behavior)
				compact = false, -- Open diffs in compact mode by default (fold unchanged regions; toggle with gc)
			},

			-- Explorer panel configuration
			explorer = {
				position = "left", -- "left" or "bottom"
				hidden = false, -- Initial visibility state
				width = 40, -- Width when position is "left" (columns)
				height = 15, -- Height when position is "bottom" (lines)
				auto_refresh = true, -- Auto-refresh file list on focus / git index changes (set false to avoid lag in huge repos; R still refreshes manually)
				indent_markers = true, -- Show indent markers in tree view (│, ├, └)
				initial_focus = "explorer", -- Initial focus: "explorer", "original", or "modified"
				icons = {
					folder_closed = "", -- Nerd Font folder icon (customize as needed)
					folder_open = "", -- Nerd Font folder-open icon
				},
				view_mode = "list", -- "list" or "tree"
				flatten_dirs = true, -- Flatten single-child directory chains in tree view
				file_filter = {
					ignore = { ".git/**", ".jj/**" }, -- Glob patterns to hide (e.g., {"*.lock", "dist/*"})
				},
				untracked = "all", -- Untracked scan: "all", "normal" (collapse dirs), or "no" (skip; use for huge work trees like GIT_WORK_TREE=$HOME that hang, #389)
				focus_on_select = false, -- Jump to modified pane after selecting a file (default: stay in explorer)
				auto_open_on_cursor = false, -- Rebind j/k/Down/Up in the explorer to also open the file under the cursor
				status_right_margin = 1, -- Trailing cells between status symbol (M/A/D) and right edge; increase if Nerd Font icons clip it
				line_stats = {
					enabled = false, -- Fetch and show Git line statistics
					count_untracked = false, -- Count untracked file lines as insertions
					max_untracked_bytes = 1024 * 1024, -- Skip larger untracked files
				},
				ellipsis = "…", -- Text appended to truncated Explorer regions
				formatters = { -- Optional function(ctx) -> line layout callbacks; omit to use the built-ins
					file = nil, -- File rows
					folder = nil, -- Directory rows in tree view
					group = nil, -- Section headers such as Changes and Staged Changes
				},
				visible_groups = { -- Which groups to show (can be toggled at runtime)
					staged = true,
					unstaged = true,
					conflicts = true,
				},
			},

			-- History panel configuration (for :CodeDiff history)
			history = {
				position = "bottom", -- "left" or "bottom" (default: bottom)
				width = 40, -- Width when position is "left" (columns)
				height = 15, -- Height when position is "bottom" (lines)
				initial_focus = "history", -- Initial focus: "history", "original", or "modified"
				view_mode = "list", -- "list" or "tree" for files under commits
				date_format = "%ar", -- Commit date rendering: "%ar" (default, relative), "%ai" (ISO), "%ad" (git default), or any strftime string (e.g. "%Y/%m/%d %H:%M:%S")
			},

			-- Keymaps in diff view
			keymaps = {
				view = {
					quit = "q", -- Close diff tab
					toggle_explorer = "<leader>b", -- Toggle explorer visibility (explorer mode only)
					focus_explorer = "<leader>e", -- Focus explorer panel (explorer mode only)
					next_hunk = "]c", -- Jump to next change
					prev_hunk = "[c", -- Jump to previous change
					next_file = "]f", -- Next file in explorer/history mode
					prev_file = "[f", -- Previous file in explorer/history mode
					diff_get = "do", -- Get change from other buffer (like vimdiff)
					diff_put = "dp", -- Put change to other buffer (like vimdiff)
					open_in_prev_tab = "gf", -- Open current buffer in previous tab (or create one before)
					close_on_open_in_prev_tab = false, -- Close codediff tab after gf opens file in previous tab
					toggle_stage = "-", -- Stage/unstage current file (works in explorer and diff buffers)
					toggle_staged_view = "gS", -- Swap between staged/unstaged view of current file (#352)
					stage_hunk = "<leader>hs", -- Stage hunk under cursor to git index
					unstage_hunk = "<leader>hu", -- Unstage hunk under cursor from git index
					discard_hunk = "<leader>hr", -- Discard hunk under cursor (working tree only)
					hunk_textobject = "ih", -- Textobject for hunk (vih to select, yih to yank, etc.)
					show_help = "g?", -- Show floating window with available keymaps
					align_move = "gm", -- Temporarily align moved code blocks across panes
					toggle_layout = "t", -- Toggle between side-by-side and inline layout
					toggle_compact = "gc", -- Toggle compact mode (fold unchanged regions)
				},
				explorer = {
					select = "<CR>", -- Open diff for selected file
					hover = "K", -- Show file diff preview
					refresh = "R", -- Refresh git status
					toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
					stage_all = "S", -- Stage all files
					unstage_all = "U", -- Unstage all files
					restore = "X", -- Discard changes (restore file)
					toggle_changes = "gu", -- Toggle Changes (unstaged) group visibility
					toggle_staged = "gs", -- Toggle Staged Changes group visibility
					-- Fold keymaps (Vim-style)
					fold_open = "zo", -- Open fold (expand current node)
					fold_open_recursive = "zO", -- Open fold recursively (expand all descendants)
					fold_close = "zc", -- Close fold (collapse current node)
					fold_close_recursive = "zC", -- Close fold recursively (collapse all descendants)
					fold_toggle = "za", -- Toggle fold (expand/collapse current node)
					fold_toggle_recursive = "zA", -- Toggle fold recursively
					fold_open_all = "zR", -- Open all folds in tree
					fold_close_all = "zM", -- Close all folds in tree
				},
				history = {
					select = "<CR>", -- Select commit/file or toggle expand
					toggle_view_mode = "i", -- Toggle between 'list' and 'tree' views
					refresh = "R", -- Refresh history (re-fetch commits)
					-- Fold keymaps (Vim-style, apply to directory nodes only)
					fold_open = "zo", -- Open fold (expand current node)
					fold_open_recursive = "zO", -- Open fold recursively (expand all descendants)
					fold_close = "zc", -- Close fold (collapse current node)
					fold_close_recursive = "zC", -- Close fold recursively (collapse all descendants)
					fold_toggle = "za", -- Toggle fold (expand/collapse current node)
					fold_toggle_recursive = "zA", -- Toggle fold recursively
					fold_open_all = "zR", -- Open all folds in tree
					fold_close_all = "zM", -- Close all folds in tree
				},
				conflict = {
					accept_incoming = "<leader>ct", -- Accept incoming (theirs/left) change
					accept_current = "<leader>co", -- Accept current (ours/right) change
					accept_both = "<leader>cb", -- Accept both changes (incoming first)
					discard = "<leader>cx", -- Discard both, keep base
					-- Accept all (whole file) - uppercase versions
					accept_all_incoming = "<leader>cT", -- Accept ALL incoming changes
					accept_all_current = "<leader>cO", -- Accept ALL current changes
					accept_all_both = "<leader>cB", -- Accept ALL both changes
					discard_all = "<leader>cX", -- Discard ALL, reset to base
					next_conflict = "]x", -- Jump to next conflict
					prev_conflict = "[x", -- Jump to previous conflict
					diffget_incoming = "2do", -- Get hunk from incoming (left/theirs) buffer
					diffget_current = "3do", -- Get hunk from current (right/ours) buffer
				},
			},
		},
	},
	-- Beacon - flash cursors
	"DanilaMihailov/beacon.nvim",

	-- go to alt file, replacement for projectionist
	"rgroli/other.nvim",

	--Sessions
	--use("rmagatti/auto-session")
	--use("rmagatti/session-lens")
	"rktjmp/lush.nvim",
	--use("~/code/sessionverse.nvim")
	--use("~/bin/hemisush")

	-- Lua
	--"olimorris/persisted.nvim",
	-- marks
	"chentoast/marks.nvim",

	-- fidget - lsp status virtual text
	{
		"j-hui/fidget.nvim",
		tag = "legacy",
		event = "LspAttach",
		opts = {
			-- options
		},
	},
	-- tmux
	"LnL7/vim-tslime",
	"janko-m/vim-test",

	-- window titles
	--[[ { ]]
	--[[ 	"b0o/incline.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		require("incline").setup() ]]
	--[[ 	end, ]]
	--[[ }, ]]
}

local opts = {}
lazy.setup(plugins, opts)
vim.keymap.set("n", "<leader>B", "<cmd>AerialToggle!<CR>")
