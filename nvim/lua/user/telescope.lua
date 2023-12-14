local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local horizontalLayout =
	'{ layout_strategy = "vertical", layout_config = { width = 0.95, height = 0.95, preview_height = { 0.7, min = 10 } } }'

telescope.setup({
	defaults = {
		prompt_prefix = " ",
		selection_caret = " ",
		path_display = { "smart" },
		shorten_path = true,
		layout_strategy = "vertical",
		layout_config = {
			vertical = { width = 0.95 },
			horizontal = { width = 0.95 },
			preview_height = { 0.7, min = 10 },
		},
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-Q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-z>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
				["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
				["<C-g>"] = actions.send_to_qflist + actions.open_qflist,
				["<C-G>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
			},
		},
	},
	file_ignore_patterns = { "types.d.ts", "%.zip" },
	winblend = 7,
	pickers = {
		current_buffer_tags = { fname_width = 100 },

		jumplist = { fname_width = 100 },

		loclist = { fname_width = 100 },

		lsp_definitions = { fname_width = 100 },

		lsp_document_symbols = { fname_width = 100 },

		lsp_dynamic_workspace_symbols = { fname_width = 100 },

		lsp_implementations = { fname_width = 100 },

		lsp_incoming_calls = { fname_width = 100 },

		lsp_outgoing_calls = { fname_width = 100 },

		lsp_references = { fname_width = 100 },

		lsp_type_definitions = { fname_width = 100 },

		lsp_workspace_symbols = { fname_width = 100 },

		quickfix = { fname_width = 100 },

		tags = { fname_width = 100 },
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			file_ignore_patterns = { "%.zip" },

			-- the default case_mode is "smart_case"
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("live_grep_args")
-- yanky setup
--require("telescope").load_extension("lazygit")
