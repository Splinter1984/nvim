local M = {}

function M.nv_del_trailing_white()
  vim.cmd("%s/;\\s\\+$/;/e")
  vim.cmd("noh")
end

return M
