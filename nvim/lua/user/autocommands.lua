vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end


  augroup _save_folds
    autocmd!
    au BufWinLeave, BufLeave ?* silent! mkview
    au BufWinEnter           ?* silent! loadview
  augroup end

  augroup _lsp
    autocmd!
    autocmd BufWritePre * lua vim.lsp.buf.format()
  augroup end

  autocmd BufRead,BufEnter,BufNewFile /Users/vinsonchuong/Code/zeck/*
  \ let test#project_root = './'

  autocmd BufRead,BufEnter,BufNewFile /Users/ignu/code/zeck/api/app/*
    \ let test#project_root = './api/app' |
    \ let test#python#runner = 'mamba' |
    \ let test#python#mamba#options = '--format documentation'
  
  autocmd BufRead,BufEnter,BufNewFile /Users/ignu/code/zeck/ui/*
    \ let test#project_root = './ui' |
    \ let test#javascript#runner = 'jest' |
    \ let test#javascript#jest#options = '--env=jest-environment-jsdom-global --setupFilesAfterEnv ./config/env --setupFilesAfterEnv ./config/testEnv --setupFilesAfterEnv ./src/setupTests.js --runInBand'
  
  autocmd BufRead,BufEnter,BufNewFile /Users/ignu/code/zeck/ui/playwright/*
    \ let test#project_root = './ui' |
    \ let test#javascript#runner = 'playwright' |
    \ let test#javascript#playwright#options = '--workers=6 --trace=on --reporter=list --headed'

  autocmd BufRead,BufEnter,BufNewFile /Users/ignu/code/zeck/lambdas-api/*
    \ let test#project_root = './lambdas-api' |
    \ let test#javascript#runner = 'jest' |
    \ let test#javascript#jest#options = ''
  
  autocmd BufRead,BufEnter,BufNewFile /Users/ignu/code/zeck/editor-content/*
    \ let test#project_root = './editor-content' |
    \ let test#javascript#runner = 'jest' |
    \ let test#javascript#jest#options = ''
  
  autocmd BufRead,BufEnter,BufNewFile /Users/ignu/code/zeck/editor/*
    \ let test#project_root = './editor' |
    \ let test#javascript#runner = 'jest' |
    \ let test#javascript#jest#options = ''
]])
-- augroup _blame_line_auto
--   autocmd BufEnter * EnableBlameLine
-- augroup end
--  augroup remember_folds
--    autocmd!
--    au BufWinLeave ?* mkview 1
--    au BufWinEnter ?* silent! loadview 1
--  augroup END
