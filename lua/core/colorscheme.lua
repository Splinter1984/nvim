local colorscheme = "gruvbox"
--[[
vim.opt.termguicolors = true
vim.opt.background = 'dark'
local conf_ok, _ = pcall(
  function()
    vim.g.gruvbox_contrast_dark = 'soft'
    vim.g.gruvbox_invert_ident_guides = 1
    vim.g.gruvbox_improved_warnings = 1
  end
)
]]--
local conf_ok, scheme = pcall(require, "gruvbox")
if not conf_ok then
  vim.api.nvim_err_writeln (
    string.format("ERROR during conf colorscheme=%s", colorscheme))
  return
end

scheme.setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = false,
    emphasis = false,
    comments = false,
    operators = false,
    folds = false,
  },
  strikethrough = true,
  invert_selection = true,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
    Operator = { link = "GruvboxFg1" },
    Macro = { link = "GruvboxPurple" },
    DiagnosticHint = { link = "GruvboxGray" },
    DiagnosticSignHint = { link = "GruvboxGray" },
    GitSignsAdd = { link = "GruvboxGreenSign" },
    GitSignsChange = { link = "GruvboxBlueSign" },
    GitSignsDelete = { link = "GruvboxRedSign" },
    ["@variable"] = { link="GruvboxBlue" },
  },
  dim_inactive = false,
  transparent_mode = false,
})

local init_ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not init_ok then
  vim.api.nvim_err_writeln (
    string.format("ERROR during init colorscheme=%s", colorscheme))
  return
end
