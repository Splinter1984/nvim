-- Functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = false }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

--map('n', '<C-Right>', ':tabnext<CR>', {noremap = true, silent = true})
--map('n', '<C-Left>', ':tabprevious<CR>', {noremap = true, silent = true})
--map('n', '<C-n>', ':tabnew<CR>', {noremap = true, silent = true})
--map('n', '<C-x>', ':tabclose<CR>', {noremap = true, silent = true})
map('n', '<Leader>cd', ':cd %:p:h<CR>:pwd<CR>', {noremap = false, silent = false})

-- buffer keymaps
map('n', '<C-Left>', ':BufferLineCyclePrev<CR>', {noremap = true, silent = true})
map('n', '<C-Right>', ':BufferLineCycleNext<CR>', {noremap = true, silent = true})
map('n', '<C-x>', ':BufferLinePickClose<CR>', {noremap = true, silent = true})
