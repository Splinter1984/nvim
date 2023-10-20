local colorscheme = "gruvbox"

vim.opt.termguicolors = true
vim.opt.background = 'dark'
local ok, _ = pcall(
  function()
    vim.g.gruvbox_contrast_dark = 'soft'
    vim.g.gruvbox_invert_ident_guides = 1
    vim.g.gruvbox_improved_warnings = 1
  end
)
if not ok then
  return
end
--[[
local status, theme = pcall(require, colorscheme)
if not status then
  return
end

theme.setup {
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = false,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}
]]--
local scheme_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not scheme_ok then
  return
end
