local status_ok, lsp = pcall(require, "lsp-zero")
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

lsp.setup()

