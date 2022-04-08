local core_modules = {
    'core.plugins'
    --'lsp-config',
    --"cmp-config",
    --"gitsigns-config",
    --"treesitter-config",
    --"marks-config",
    --"webicon-config",
    --"general-config",
    --"format-config",
    --'telescope-config',
    --"prettierd"
    --'keymaps'
}

-- Using pcall we can handle better any loading issues
for _, module in ipairs(core_modules) do
    local ok, err = pcall(require, module)
    if not ok then
        error('Error loading ... ' .. module .. '\n\n' .. err)
    end
end
-- set runtimepath+=~/.vim,~/.vim/after
-- set packpath+=~/.vim
-- source ~/.vimrc
-- set termguicolors
--
-- " my test command on most projects these days.
-- noremap <F1> :w!<cr> :Tx npm run test<cr>
--
-- vnoremap J :m '>+1<CR>gv=gv
-- vnoremap K :m '<-2<CR>gv=gv
--
--
-- "let g:neovide_transparency=0.8
-- "let g:neovide_fullscreen=v:true
-- set guifont=DankMono\ Nerd\ Font
