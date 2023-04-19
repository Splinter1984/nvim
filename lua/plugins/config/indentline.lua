local status_ok, indentline = pcall(require, "indent_blankline")
if not status_ok then
    return
end

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
