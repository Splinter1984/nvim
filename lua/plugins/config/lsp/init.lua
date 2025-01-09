local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  print(_)
  return
end

require "plugins.config.lsp.mason"
require ("plugins.config.lsp.handlers").setup()
--require "plugins.config.lsp.null-ls"
