local opts = {
    cmd = {
        'clangd',
        '--header-insertion=never',
        '--background-index',
        '--suggest-missing-include',
    },
    filetypes = {'c', 'cpp'},
    single_file_support=true,
}

return opts
