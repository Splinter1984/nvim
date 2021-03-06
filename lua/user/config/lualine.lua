local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local gps = require 'nvim-gps'

require'lualine'.setup {
    options = {
        icons_enabled = true,
        theme = 'gruvbox',
        component_separators = {
            left = '',
            right = ''
        },
        section_separators = {
            left = '',
            right = ''
        },
        disabled_filetypes = {},
        always_divide_middle = true
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', {
            'diagnostics',
            sources = {'nvim_diagnostic', 'coc'}
        }},
        lualine_c = {{
            'filename',
            file_status = true
        }, {
            gps.get_location,
            cond = gps.is_available
        }},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {{
            'filename',
            file_status = true,
            path = 0
        }},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {'fugitive'}
}
