local cmp_status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not cmp_status_ok then
    return
end

require('nvim-treesitter.install').compilers = { "clang" }

configs.setup {
    ensure_installed = {"cpp", "bash", "rust", "lua", "python"},
    sync_install = false,
    ignore_install = {""}, -- List of parsers to ignore installing
    highlight = {
        enable = true, -- false will disable the whole extension
        disable = {"org"}, -- list of language that will be disabled
        additional_vim_regex_highlighting = true

    },
    indent = {
        enable = true,
        disable = {"yaml"}
    },
    context_commentstring = {
        enable = true,
        enable_autocmd = false,
    },
}

