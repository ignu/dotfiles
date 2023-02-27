local fn = vim.fn

local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
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
	{ "mrjones2014/nvim-ts-rainbow", event = "VeryLazy" },
	"tpope/vim-surround",
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
	"windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
	"numToStr/Comment.nvim", -- Easily comment stuff
	"kyazdani42/nvim-web-devicons",
	"kyazdani42/nvim-tree.lua",
	--use 'akinsho/bufferline.nvim'
	"moll/vim-bbye",
	"nvim-lualine/lualine.nvim",
	--use("akinsho/toggleterm.nvim")
	"ahmedkhalf/project.nvim",
	-- use({
	-- 	"charludo/projectmgr.nvim",
	-- 	rocks = { "lsqlite3" },
	-- })
	"lewis6991/impatient.nvim",
	{ "lukas-reineke/indent-blankline.nvim", event = "VeryLazy" },
	"antoinemadec/FixCursorHold.nvim", -- This is needed to fix lsp doc highlight
	"folke/which-key.nvim",

	-------------------
	-- 🎨 Colorschemes
	-------------------
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	"kvrohit/mellow.nvim",
	"ray-x/aurora",
	"ramojus/mellifluous.nvim",
	--use("Domeee/mosel.nvim")
	--use("shaunsingh/oxocarbon.nvim")
	--use("Yazeed1s/minimal.nvim")
	--use("adisen99/codeschool.nvim")
	--use("tjdevries/colorbuddy.nvim")
	--use("lunarvim/darkplus.nvim")
	"rebelot/kanagawa.nvim",
	--use("AlessandroYorba/Alduin")
	"yashguptaz/calvera-dark.nvim",
	"shaunsingh/moonlight.nvim",
	"trevordmiller/nova-vim",
	"whatyouhide/vim-gotham",
	"gruvbox-community/gruvbox",
	"nanotech/jellybeans.vim",
	"noahfrederick/vim-hemisu",
	"sainnhe/everforest",
	--"savq/melange",
	"shaeinst/roshnivim-cs",
	"EdenEast/nightfox.nvim",
	"folke/tokyonight.nvim",
	--use("sainnhe/edge")
	--use("kvrohit/rasmus.nvim")
	--use("Abstract-IDE/Abstract-cs")
	"rafamadriz/neon",
	--use("beikome/cosme.vim")
	"arturgoms/moonbow.nvim",
	--use("cocopon/iceberg.vim")
	--use("rose-pine/neovim")
	"ray-x/starry.nvim",
	--use("kyazdani42/blue-moon")
	--use("glepnir/zephyr-nvim")
	--use("adisen99/apprentice.nvim")
	"rockerBOO/boo-colorscheme-nvim",
	"bluz71/vim-moonfly-colors",
	--[[ use({ ]]
	--[[ 	"olivercederborg/poimandres.nvim", ]]
	--[[ 	config = function() ]]
	--[[ 		require("poimandres").setup({ ]]
	--[[ 			-- leave this setup function empty for default config ]]
	--[[ 			-- or refer to the configuration section ]]
	--[[ 			-- for configuration options ]]
	--[[ 		}) ]]
	--[[ 	end, ]]
	--[[ }) ]]

	-- remember last color
	--{ "rojspencer/vim-colorminder", event = "VeryLazy" },
	{ "rojspencer/vim-colorminder" },

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
	"AndrewRadev/tagalong.vim",

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
	"neovim/nvim-lspconfig", -- enable LSP
	{
		"SmiteshP/nvim-navic",
		dependencies = { "neovim/nvim-lspconfig" },
	},
	"williamboman/nvim-lsp-installer", -- simple to use language server installer
	"tamago324/nlsp-settings.nvim", -- language server settings defined in json for
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
	--[[ config = function() ]]
	--[[ 	require("lsp_lines").setup() ]]
	"jinzhongjia/LspUI.nvim",

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
	"j-hui/fidget.nvim",

	-- tmux
	"LnL7/vim-tslime",
	"janko-m/vim-test",
}

local opts = {}

lazy.setup(plugins, opts)
vim.keymap.set("n", "<leader>B", "<cmd>AerialToggle!<CR>")
