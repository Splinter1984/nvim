local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
  print(fzf)
  return
end

fzf.setup {
  winopts = {
    --split = "belowright new",
    preview = {
      hidden = 'hidden',
      vertical = 'up:50%',
      layout = 'vertical'
    },
    height = 0.90,
    width = 0.99,
    border = 'single'
  },
  keymap = {
    builtin = {
      ["<C-i>"]        = "toggle-help",
      ["<C-o>"]        = "toggle-fullscreen",
      ["<C-p>"]        = "toggle-preview",
      ["<C-[>"]        = "toggle-preview-ccw",
      ["<C-]>"]        = "toggle-preview-cw",
      ["<S-down>"]     = "preview-page-down",
      ["<S-up>"]       = "preview-page-up",
      ["<S-left>"]     = "preview-page-reset",
    },
  },
}

