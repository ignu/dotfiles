require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filename'},
    --lualine_c = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'diff', 'diagnostics'},
    --lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_x = { 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {'filename'},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

vim.notify = require("notify")

require('telescope').load_extension('luasnip')
