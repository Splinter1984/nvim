local opt = vim.opt
local g = vim.g

opt.termguicolors = true
opt.background = 'dark'

g.gruvbox_contrast_dark = 'soft'
g.gruvbox_invert_indent_guides = 1
g.gruvbox_improved_warnings = 1
--g.gruvbox_invert_indent_guides = 1
--g.gruvbox_improved_strings = 1


--g.gruvbox_material_background = 'soft'
--[[
g.gruvbox_material_foreground = 'material'
g.gruvbox_material_disable_terminal_colors=1
g.gruvbox_materila_better_perfomance = 1
vim.cmd "colorscheme gruvbox-material"
]]--
vim.cmd "colorscheme gruvbox"
