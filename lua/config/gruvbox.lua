local M = {}

function M.setup()
    local opt = vim.opt
    local g = vim.g

    opt.termguicolors = true

    g.gruvbox_contrast_dark = 'soft'
    g.gruvbox_invert_indent_guides = 1
    g.gruvbox_improved_warnings = 1
end

return M
