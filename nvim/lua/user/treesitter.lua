-- nvim-treesitter no longer uses configs.setup() for highlight/indent.
-- Treesitter highlighting is handled natively by nvim when parsers are installed.

require("treesitter-context").setup({
	enable = true,
	max_lines = 0,
	trim_scope = "outer",
	zindex = 20,
	mode = "cursor",
})

require("nvim-custom-diagnostic-highlight").setup({})
