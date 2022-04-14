local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

keymap("n", "<Left>", ":w<CR> :cprev<CR>", opts)
keymap("n", "<Right>", ":w<CR> :cnext<CR>", opts)
keymap("n", "<Down>", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<Up>", ":Gitsigns prev_hunk<CR>", opts)

-- YANK TO EOL
keymap("n", "Y", "y$", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- close buffer and not window
keymap("n", "<leader>r", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

-- Alt-y and Alt-p to use clipboard
keymap("n", "<A-y>", '"+y', opts)
keymap("n", "<A-p>", '"+p', opts)

-- open changed files
keymap("n", "<C-p>", ":Telescope git_files<CR>", opts)
-- open changed files
keymap("n", "<C-o>", ":Telescope git_status<CR>", opts)
keymap("n", "<C-b>", ":ToggleBlameLine<CR>", opts)

-- ctrl-save
keymap("n", "<c-s>", ":w<cr>", opts)
keymap("i", "<c-s>", "<esc>:w<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

keymap("n", "-", ":NvimTreeToggle<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- tab through tabs
keymap("n", "<Tab>", ":tabn<cr>", opts)
keymap("n", "<S-Tab>", ":tabp<cr>", opts)

keymap("n", "<S-Tab>", ":tabp<cr>", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- quick fix list
keymap("n", "\\", ":cclose<CR>", opts)
keymap("n", "<Leader>\\", ":copen<CR>", opts)

-- lsp
keymap("n", "K", ":lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "ga", "lua vim.lsp.buf.code_action()<cr>", opts)

-- function keys
keymap("n", "F4", ":if (hlstate == 0) | nohlsearch | else | set hlsearch | endif | let hlstate=1-hlstate<cr>", opts)

-- Terminal --
-- Better terminal navigation
local term_opts = { silent = true }
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
