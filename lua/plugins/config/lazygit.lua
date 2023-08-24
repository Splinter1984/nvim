local status_ok, lazygit = pcall(require, "lazy")
if not status_ok then
  return
end

lazygit.setup ({})
