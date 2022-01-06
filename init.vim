set runtimepath+=~/.vim,~/.vim/after
set packpath+=~/.vim
source ~/.vimrc
set termguicolors
lua require("lsp-config")
lua require("cmp-config")
lua require("gitsigns-config")
lua require("treesitter-config")
lua require("marks-config")
lua require("webicon-config")
lua require("general-config")
lua require("format-config")

" my test command on most projects these days.
noremap <F1> :w!<cr> :Tx npm run test<cr>
