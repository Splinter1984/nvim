local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  print(ibl)
    return
end

ibl.setup({
  indent = {
    char = "┊",
    smart_indent_cap = false,
  },
  scope = {
    enabled = false,
    show_start = false,
    show_end = false,
  },
})
--[[
{
    indent = { highlight = highlight, char = "" },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
]]--
--[[
indentline.setup {
  char = "┊",
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = true,
  show_current_context = false,
  space_char_blankline = " ",
  buftype_exclude = { "terminal", "nofile" },
  filetype_exclude = {
    "help",
    "packer",
    "NvimTree",
  },
}
]]--
