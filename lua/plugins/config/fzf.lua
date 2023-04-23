local status_ok, fzf = pcall(require, "fzf-lua")
if not status_ok then
  return
end

fzf.setup {
  winopts = {
    width = 0.95
  }
}
