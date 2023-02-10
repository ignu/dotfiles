local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.lsp-installer")
require("user.lsp.handlers").setup()
require("user.lsp.null-ls")
require("fidget").setup({})
local navic = require("nvim-navic")

lspconfig.clangd.setup({
  on_attach = function(client, bufnr)
    navic.attach(client, bufnr)
  end,
})

require("lsp_signature").setup({})

require("lsp_lines").setup()

local M = {}

local enabled = true

function M.setup()
  vim.diagnostic.config({ virtual_text = enabled })
  require("lsp_lines").setup()

  vim.keymap.set("n", "<Leader>le", function()
    enabled = not enabled
    if enabled == true then
      vim.diagnostic.config({
        virtual_text = {
          prefix = "●",
          source = "always",
        },
      })
    else
      vim.diagnostic.config({
        virtual_text = false,
      })
    end
    require("lsp_lines").toggle()
  end, {
    desc = "Toggle lsp_lines",
  })
end

return M
