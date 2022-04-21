local cmd = vim.cmd
local opt = vim.opt
local glob = vim.g

opt.termguicolors = true

glob.gruvbox_contrast_dark = 'soft'
glob.gruvbox_invert_indent_guides = 1
glob.gruvbox_improved_warnings = 1

cmd 'colorscheme gruvbox'

