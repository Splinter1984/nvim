local status_ok, lsp = pcall(require, "lsp-zero")
if not status_ok then
    return
end

-- use recommended settigns
lsp.preset('recommended')

-- lsp.ensure_installed({
--     'cpp',
--     'python',
--     'lua',
--     'cmake'
-- })

lsp.setup()

