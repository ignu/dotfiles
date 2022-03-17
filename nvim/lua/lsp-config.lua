local lspconfig = require("lspconfig")
local saga = require('lspsaga')

local null_ls = require("null-ls")

local buf_map = function(bufnr, mode, lhs, rhs, opts)
    vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {
        silent = true,
    })
end

saga.init_lsp_saga {
    error_sign = '',
    warn_sign = '',
    hint_sign = '.',
    border_style = "round",
}

local lsp = vim.lsp
local handlers = lsp.handlers

local lsp_signature_config = {
  debug = false, -- set to true to enable debug logging
  log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  -- default is  ~/.cache/nvim/lsp_signature.log
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = false, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  use_lspsaga = true,  -- set to true if you want to use lspsaga popup
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none
  },
  always_trigger = true,
  auto_close_after = 5, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom


  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

local lsp_signature = require "lsp_signature"

local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for each installed server when it's ready (i.e. when installation is finished
-- or if the server is already installed).
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function will take the provided server configuration and decorate it with the necessary properties
    -- before passing it onwards to lspconfig.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)


lspconfig.tsserver.setup({
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local ts_utils = require("nvim-lsp-ts-utils")
        ts_utils.setup({})
        ts_utils.setup_client(client)
        buf_map(bufnr, "n", "gs", ":TSLspOrganize<CR>")
        buf_map(bufnr, "n", "gi", ":TSLspRenameFile<CR>")
        buf_map(bufnr, "n", "go", ":TSLspImportAll<CR>")
        on_attach(client, bufnr)
    end,
})

local prettier = require("prettier")


prettier.setup({
  bin = 'prettier', -- or `prettierd`
  filetypes = {
    "css",
    "graphql",
    "html",
    "javascript",
    "javascriptreact",
    "json",
    "less",
    "markdown",
    "scss",
    "typescript",
    "typescriptreact",
    "yaml",
  }
})

local on_attach = function(client, bufnr)
  lsp_signature.on_attach(lsp_signature_config)

  -- lsp provider to find the cursor word definition and reference
    vim.cmd("command! LspDef lua vim.lsp.buf.definition()")
    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
    vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
    vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
    vim.cmd("command! LspRefs lua vim.lsp.buf.references()")
    vim.cmd("command! LspTypeDef lua vim.lsp.buf.type_definition()")
    vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
    vim.cmd("command! LspDiagPrev lua vim.diagnostic.goto_prev()")
    vim.cmd("command! LspDiagNext lua vim.diagnostic.goto_next()")
    vim.cmd("command! LspDiagLine lua vim.diagnostic.open_float()")
    vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")    
    buf_map(bufnr, "n", "gd", ":LspDef<CR>")
    --buf_map(bufnr, "n", "gr", ":LspRename<CR>")
    buf_map(bufnr, "n", "gy", ":LspTypeDef<CR>")
    buf_map(bufnr, "n", "K", ":Lspsaga hover_doc<CR>")
    --buf_map(bufnr, "n", "K", ":LspHover<CR>")
    buf_map(bufnr, "n", "[a", ":LspDiagPrev<CR>")
    buf_map(bufnr, "n", "]a", ":LspDiagNext<CR>")
    buf_map(bufnr, "n", "ga", ":LspCodeAction<CR>")
    buf_map(bufnr, "n", "<Leader>a", ":LspDiagLine<CR>")
    buf_map(bufnr, "i", "<C-x><C-x>", "<cmd> LspSignatureHelp<CR>")    
    local map = nvim_buf_set_keymap,
    buf_map(bufnr, "n", "gr", "<cmd>Lspsaga rename<cr>", {silent = true, noremap = true})
    -- this one is creating a modal that i can't close
    --buf_map(bufnr, "n", "ga", "<cmd>Lspsaga code_action<cr>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "ga", "<cmd>:LspCodeAction<cr>", {silent = true, noremap = true})
    buf_map(bufnr, "x", "ga", ":<c-u>Lspsaga range_code_action<cr>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", {silent = true, noremap = true})
    buf_map(bufnr, "n", "<C-j>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>")
    buf_map(bufnr, "n", "<C-k>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>")
    buf_map(bufnr, "n", "gh", ":<c-u>Lspsaga lsp_finder<cr>", {silent = true, noremap = true})
    --if client.resolved_capabilities.document_formatting then
    --    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
    --end
    if client.resolved_capabilities.document_formatting then
      vim.cmd("nnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.formatting()<CR>")
      -- format on save
      vim.cmd("autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting_seq_sync()")
    end

    if client.resolved_capabilities.document_range_formatting then
      vim.cmd("xnoremap <silent><buffer> <Leader>f :lua vim.lsp.buf.range_formatting({})<CR>")
    end
end

null_ls.setup({
    sources = {
        --null_ls.builtins.diagnostics.eslint,
        --null_ls.builtins.code_actions.eslint,
        null_ls.builtins.formatting.prettier,
    },
    on_attach = on_attach,
})
