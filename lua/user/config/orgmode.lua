require('orgmode').setup_ts_grammar()

local status_ok, orgmode = pcall(require, "orgmode")
if not status_ok then
    return
end

orgmode.setup({})
