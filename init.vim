set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
set termguicolors
lua require("lsp-config")
lua require("cmp-config")
lua require("gitsigns-config")
lua require("treesitter-config")

" my test command on most projects these days.
noremap <F1> :w!<cr> :Tx npm run test<cr>
