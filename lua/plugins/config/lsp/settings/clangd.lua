return {
  cmd = {
    'clangd',
    '--header-insertion=never',
    '--background-index',
  },
  filetypes = {'c', 'cpp'},
  single_file_support=true,
}
