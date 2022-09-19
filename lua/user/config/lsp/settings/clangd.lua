local opts = {
    cmd = {
        'clangd',
        '--header-insertion=never'
    },
    single_file_support=true,
}

return opts
