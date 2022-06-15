local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Could not load packer", vim.o.error_bell)
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself

	-- surround.vim replacement
	use("machakann/vim-sandwich")

	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	--use 'akinsho/bufferline.nvim'
	use("moll/vim-bbye")
	use("nvim-lualine/lualine.nvim")
	--use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	use("lewis6991/impatient.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("goolord/alpha-nvim")
	use("antoinemadec/FixCursorHold.nvim") -- This is needed to fix lsp doc highlight
	use("folke/which-key.nvim")

	-- Colorschemes
	-- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
	use("Domeee/mosel.nvim")
	use("adisen99/codeschool.nvim")
	use("tjdevries/colorbuddy.nvim")
	use("lunarvim/darkplus.nvim")
	use("rebelot/kanagawa.nvim")
	use("AlessandroYorba/Alduin")
	use("yashguptaz/calvera-dark.nvim")
	use("shaunsingh/moonlight.nvim")
	use("trevordmiller/nova-vim")
	use("whatyouhide/vim-gotham")
	use("gruvbox-community/gruvbox")
	--use("nanotech/jellybeans.vim")
	use("noahfrederick/vim-hemisu")
	use("sainnhe/everforest")
	use("savq/melange")
	use("shaeinst/roshnivim-cs")
	use("EdenEast/nightfox.nvim")
	use("folke/tokyonight.nvim")
	use("sainnhe/edge")
	use("kvrohit/rasmus.nvim")
	use("beikome/cosme.vim")
	use("cocopon/iceberg.vim")

	use("AndrewRadev/tagalong.vim")

	-- remember last color
	use("rojspencer/vim-colorminder")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")

	-- snippets
	--use("L3MON4D3/LuaSnip") --snippet engine
	--use("ignu/friendly-snippets") -- a bunch of snippets to use

	use("dcampos/nvim-snippy")
	use("dcampos/cmp-snippy")
	use("ignu/vim-snippets")

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("tamago324/nlsp-settings.nvim") -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	use("folke/trouble.nvim") -- for troubleshooting

	use("haringsrob/nvim_context_vt") -- see method vt

	use({
		"ojroques/nvim-lspfuzzy",
		requires = {
			{ "junegunn/fzf" },
			{ "junegunn/fzf.vim" }, -- to enable preview (optional)
		},
	})
	use({
		"ray-x/lsp_signature.nvim",
	})

	-- Telescope
	--	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ --pass in options to rg
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")
	use("tveskag/nvim-blame-line")
	use("TimUntersberger/neogit")
	use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })

	use("ojroques/vim-oscyank")
	use("ruifm/gitlinker.nvim")

	-- modern YankRing
	use({
		"gbprod/yanky.nvim",
		config = function()
			require("yanky").setup({})
		end,
	})

	-- Beacon - flash cursors
	use("DanilaMihailov/beacon.nvim")

	-- Copilot
	--use("github/copilot.vim")
	--	use("hrsh7th/cmp-copilot")

	--Sessions
	--use("rmagatti/auto-session")
	--use("rmagatti/session-lens")
	use("rktjmp/lush.nvim")
	use("~/code/sessionverse.nvim")
	use("~/bin/hemisush")

	-- marks
	use("chentoast/marks.nvim")

	-- fidget - lsp status virtual text
	use("j-hui/fidget.nvim")

	-- highlight current block
	use({
		"folke/twilight.nvim",
	})

	-- tmux
	use("LnL7/vim-tslime")
	use("janko-m/vim-test")

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
