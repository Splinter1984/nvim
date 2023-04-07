local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

gitsigns.setup {
  signs = {
    add =          { text = "▎" },
    change =       { text = "▎" },
    delete =       { text = "▎" },
    topdelete =    { text = "▎" },
    changedelete = { text = "▎" },
    untracked =    { text = "▎" },
  },
  signcolumn = true,
  watch_gitdir = {
    interval = 1000,
    folow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "eol",
    delay = 1000,
    ignore_whitespace = false,
  },
}
