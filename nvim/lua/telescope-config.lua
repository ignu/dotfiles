-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- You dont need to set any of these options. These are the default ones. Only
-- the loading is important
require('telescope').setup {
  find_files = {
     theme = "dropdown",
  },
  defaults = {
    winblend = 9,
    path_display={"smart"},
    layout_config = {
      vertical = { width = 1.1 },
      -- other layout configuration here
    }
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
require("telescope").load_extension('harpoon')
