local opts = {
    cmd = {
        'clangd-11',
        '--header-insertion=never',
    },
    single_file_support=true,
}

return opts
