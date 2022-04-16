local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
	ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	autopairs = {
		enable = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
})

require("twilight").setup({
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	dimming = {
		alpha = 0.4, -- amount of dimming
		-- we try to get the foreground from the highlight groups or fallback color
		--color = { "Normal", "#ffffff" },
		inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
	},
	context = 30, -- amount of lines we will try to show around the current line
	treesitter = true, -- use treesitter when available for the filetype
	-- treesitter is used to automatically expand the visible text,
	-- but you can further control the types of nodes that should always be fully expanded
	expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
		"function",
		"method",
		"table",
		"if_statement",
	},
	exclude = {}, -- exclude these filetypes
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
})
