local cmp_status_ok, fzf_lua = pcall(require, "fzf_lua")
if not cmp_status_ok then
    return
end

fzf_lua.setup{
    fzf_opts = {
        ['--border'] = 'false'
    } 
}

