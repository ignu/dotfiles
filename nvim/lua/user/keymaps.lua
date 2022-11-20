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

-- i never want to increment a number
keymap("n", "<C-a>", ":echo 'blah'<CR>", opts)

-- bind something to this later, i never want to alter case
keymap("n", "gu", ":echo no<CR>", opts)
keymap("n", "gU", ":echo no<CR>", opts)

-- Remap arrows
keymap("n", "<Left>", ":w<CR> :cprev<CR>", opts)
keymap("n", "<Right>", ":w<CR> :cnext<CR>", opts)
keymap("n", "<Down>", ":Gitsigns next_hunk<CR>", opts)
keymap("n", "<Up>", ":Gitsigns prev_hunk<CR>", opts)

-- YANK TO EOL
keymap("n", "Y", "y$", opts)

keymap("n", "p", "y$", opts)

-- toggle twilight
keymap("n", "=", ":Twilight<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- close buffer and not window
keymap("n", "<leader>r", ":Bdelete<CR>", opts)
keymap("n", "<leader>R", ":Bwipeout<CR>", opts)
keymap("n", ",,", ":Telescope jumplist<CR>", opts)

-- jump to the previous item, skipping the groups
-- Alt-y and Alt-p to use clipboard
keymap("n", "<A-y>", '"+y', opts)
keymap("n", "<A-p>", '"+p', opts)

-- yanky/yankring
keymap("n", "p", "<Plug>(YankyPutBefore)", opts)
keymap("n", "P", "<Plug>(YankyPutAfter)", opts)
keymap("n", "gp", "<Plug>(YankyGPutAfter)", opts)
keymap("n", "gP", "<Plug>(YankyGPutBefore)", opts)

-- OSCYANK
keymap("n", "<leader>c", ":OSCYankReg +", opts)

keymap("n", "<c-up>", "<Plug>(YankyCycleForward)", opts)
keymap("n", "<c-down>", "<Plug>(YankCycleBackward)", opts)

-- open git files
keymap("n", "<C-p>", ":Telescope git_files<CR>", opts)
keymap("n", "<leader>ff", ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>', opts)

-- ctrl-save
keymap("n", "<c-s>", ":w<cr>", opts)
keymap("i", "<c-s>", "<esc>:w<cr>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

keymap("n", "-", ":Exp<CR>", opts)

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

-- testing
keymap("n", "t", ":w!<cr>:TestNearest<cr>", opts)
keymap("n", "T", ":w!<cr>:TestFile<cr>", opts)

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

-- FUNCTION KEYS
keymap("n", "<F1>", '"+y', opts)
keymap("n", "<F2>", ":vsp<CR>", opts)
-- toggle endlines
keymap("n", "<F3>", ":NvimContextVtToggle<CR>", opts)
keymap("n", "<F4>", ":set hls!<CR>", opts)
keymap("n", "<F6>", ":set hls!<CR>", opts)
keymap("n", "<F10>", ":lua TroubleToggle", opts)
keymap("n", "<F12>", ":lua R'sessionverse'.openDirtyFiles()<CR>", opts)

-- Terminal --
-- Better terminal navigation
local term_opts = { silent = true }
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

vim.api.nvim_set_keymap("n", ",xx", "<cmd>Trouble<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ",xw", "<cmd>Trouble workspace_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ",xd", "<cmd>Trouble document_diagnostics<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ",xl", "<cmd>Trouble loclist<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", ",xq", "<cmd>Trouble quickfix<cr>", { silent = true, noremap = true })
vim.api.nvim_set_keymap("n", "gR", "<cmd>Trouble lsp_references<cr>", { silent = true, noremap = true })
