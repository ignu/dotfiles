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
lua require("telescope-config")

" my test command on most projects these days.
noremap <F1> :w!<cr> :Tx npm run test<cr>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <silent><leader>\ :lua require("harpoon.mark").add_file()<CR>
nnoremap <silent><C-e> :lua require("harpoon.ui").toggle_quick_menu()<CR>
nnoremap <silent><,>e :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

nnoremap <silent><C-1> :lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <silent><C-2> :lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <silent><C-3> :lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <silent><C-4> :lua require("harpoon.ui").nav_file(4)<CR>
nmap gf :edit <cfile><cr>

"let g:neovide_transparency=0.8
"let g:neovide_fullscreen=v:true
set guifont=DankMono\ Nerd\ Font
