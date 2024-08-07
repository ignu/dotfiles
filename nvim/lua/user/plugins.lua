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
	"wbthomason/packer.nvim", -- Have packer manage itself
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
	"lewis6991/impatient.nvim",
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
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim", -- full lines of diagnostics
	{
		"jinzhongjia/LspUI.nvim",
		branch = "legacy",
	},

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

	-- Beacon - flash cursors
	"DanilaMihailov/beacon.nvim",

	-- go to alt file, replacement for projectionist
	"rgroli/other.nvim",

	-- Copilot
	"github/copilot.vim",
	"hrsh7th/cmp-copilot",

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
