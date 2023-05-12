local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
  return
end

fzf.setup {
  winopts = {
    --split = "belowright new",
    preview = {
      vertical = 'up:50%',
      layout = 'vertical'
    },
    height = 0.90,
    width = 0.99,
    border = 'single'
  },
}

