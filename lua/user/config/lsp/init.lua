local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    return
end

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

-- use recommended settigns
lsp.preset('recommended')
lsp.nvim_workspace()

lsp.ensure_installed({
    'clangd'
})

local clangd_opts = require 'user.config.lsp.settings.clangd'

lsp.configure('clangd', clangd_opts)

local cmp_opts = require 'user.config.lsp.cmp'

lsp.setup_nvim_cmp(cmp_opts)

lsp.setup()

