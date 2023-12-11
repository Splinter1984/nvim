local colorscheme = "gruvbox"

vim.opt.termguicolors = true
vim.opt.background = 'dark'
local conf_ok, _ = pcall(
  function()
    vim.g.gruvbox_contrast_dark = 'soft'
    vim.g.gruvbox_invert_ident_guides = 1
    vim.g.gruvbox_improved_warnings = 1
  end
)
if not conf_ok then
  vim.api.nvim_err_writeln (
    string.format("ERROR during conf colorscheme=%s", colorscheme))
  return
end

local init_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not init_ok then
  vim.api.nvim_err_writeln (
    string.format("ERROR during init colorscheme=%s", colorscheme))
  return
end
