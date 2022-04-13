vim.cmd [[
try
  colorscheme rvcs
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
