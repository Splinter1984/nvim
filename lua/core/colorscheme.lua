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

local ok, _ = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
    return
end
