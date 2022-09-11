local cmp_status_ok, cmp = pcall(require, "nvim-treesitter")
if not cmp_status_ok then
    return
end

local configs = require("nvim-treesitter.configs")
configs.setup {
    ensure_installed = {"cpp", "bash", "rust", "lua", "python"},
    sync_install = false,
    ignore_install = {""}, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {""}, -- list of language that will be disabled
        additional_vim_regex_highlighting = true

    },
    indent = {
        enable = true,
        disable = {"yaml"}
    }
}

