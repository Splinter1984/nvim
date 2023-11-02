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
  colored = true
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
  'filename',
  file_status = true,      -- Displays file status (readonly status, modified status)
  newfile_status = false,  -- Display new file status (new file means no write after created)
  path = 1,                -- 0: Just the filename
                           -- 1: Relative path
                           -- 2: Absolute path
                           -- 3: Absolute path, with tilde as the home directory
                           -- 4: Filename and parent dir, with tilde as the home directory

  shorting_target = 40,    -- Shortens path to leave 40 spaces in the window
                           -- for other components. (terrible name, any suggestions?)
  symbols = {
    modified = '[+]',      -- Text to show when the file is modified.
    readonly = '[-]',      -- Text to show when the file is non-modifiable or readonly.
    unnamed = '[No Name]', -- Text to show for unnamed buffers.
    newfile = '[New]',     -- Text to show for newly created file before first write
  }
}

local function get_project()
  return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local project = {
  get_project,
  separator = { left = '', right = '' },
  --separator = { left = '', right = '' },
  color = { fg = '#282828', bg = '#83a598', 'bold' },
}
--[[ local navic = {
  'navic',
  draw_empty = true,
}
]]--

--[[
local gps = {
    gps.get_location,
    cond = gps.is_available
}
]]--

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
    lualine_b = { "branch", diagnostics, project },
    lualine_c = { filename, diff },
    lualine_x = { filetype },
    lualine_y = { "progress" },
    lualine_z = { location },
  },
}
