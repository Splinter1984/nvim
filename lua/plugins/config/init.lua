-- easy to specify the order (^~ ^`).
local modules =
{
  "lualine",
  "indentline",
  "gitsigns",
  "fzf",
  "lsp",
  "cmp",
  "treesitter",
  "todo"
}

local module_conf_path_pref = "plugins.config."
for _, item in pairs(modules) do
  local ok, _ = pcall(require, string.format(
    "%s.%s", module_conf_path_pref,item))
  if not ok then
    vim.api.nvim_err_writeln (
      string.format("[ERROR] during loading module: %s", item))
    return
  end
end
