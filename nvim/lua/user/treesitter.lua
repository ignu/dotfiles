local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup({
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
	indent = { enable = true, disable = { "yaml", "rb", "ruby" } },
	context_commentstring = {
		enable = true,
	},
})

--require("twilight").setup({
--	-- your configuration comes here
--	-- or leave it empty to use the default settings
--	-- refer to the configuration section below
--	dimming = {
--		alpha = 0.4, -- amount of dimming
--		-- we try to get the foreground from the highlight groups or fallback color
--		--color = { "Normal", "#ffffff" },
--		inactive = true, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
--	},
--	context = 30, -- amount of lines we will try to show around the current line
--	treesitter = true, -- use treesitter when available for the filetype
--	-- treesitter is used to automatically expand the visible text,
--	-- but you can further control the types of nodes that should always be fully expanded
--	expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
--		"function",
--		"method",
--		"table",
--		"if_statement",
--	},
--	exclude = {}, -- exclude these filetypes
--	-- your configuration comes here
--	-- or leave it empty to use the default settings
--	-- refer to the configuration section below
--})

require("treesitter-context").setup({
	enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
	max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
	trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
	patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
		-- For all filetypes
		-- Note that setting an entry here replaces all other patterns for this entry.
		-- By setting the 'default' entry below, you can control which nodes you want to
		-- appear in the context window.
		default = {
			"class",
			"function",
			"method",
			"for", -- These won't appear in the context
			"while",
			"if",
			"switch",
			"case",
			"describe(",
			"it(",
		},
		-- Example for a specific filetype.
		-- If a pattern is missing, *open a PR* so everyone can benefit.
		--   rust = {
		--       'impl_item',
		--   },
	},
	exact_patterns = {
		-- Example for a specific filetype with Lua patterns
		-- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
		-- exactly match "impl_item" only)
		-- rust = true,
	},

	-- [!] The options below are exposed but shouldn't require your attention,
	--     you can safely ignore them.

	zindex = 20, -- The Z-index of the context window
	mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
	separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
})

require("nvim-custom-diagnostic-highlight").setup({})
