local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
    return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic", "nvim_lsp"},
  symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
  colored = false
}

local diff = {
  "diff",
  sources = { "nvim_diagnostics" },
  colored = true,
  cond = hide_in_width,
}

local filetype = {
  "filetype",
  icons_enabled = true,
}

local location = {
  "location",
  padding = 0,
}

local filename = {
    "filename",
    file_status = true
}

--[[
local gps = {
    gps.get_location,
    cond = gps.is_available
}
--]]--

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", diagnostics },
    lualine_c = { filename, diff },
    lualine_x = { "encoding", "fileformat", filetype },
    lualine_y = { "progress" },
    lualine_z = { location },
  },
}
