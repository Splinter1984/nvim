local status_ok, fzf = pcall(require, "fzf_lua")
if not status_ok then
  return
end

fzf.setup {
  fzf_opts = {
    ['--border'] = 'false'
  }
}
