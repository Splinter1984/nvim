local cmd = vim.cmd

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'set guifont=Hack\\ Nerd\\ Font\\ Mono:h9'
cmd 'language en_US.utf-8'
cmd 'set mouse=a'
cmd 'set shiftwidth=4'
cmd 'set tabstop=4'

vim.g.visualbell = true
vim.bo.autoread = true
vim.g.backspace = '2'

vim.wo.cursorline = true
vim.g.hlsearch = true
vim.g.insearch = true
vim.g.lazyredraw = true
vim.g.magic = true
vim.g.showmatch = true
vim.g.autoread = true
vim.g.wildmenu = true
vim.g.expandtab = true
vim.g.foldcolumn = '1'
vim.g.noerrorbells = true
vim.g.smartcase = true
vim.g.smartindent = true
vim.o.ignorecase = true
vim.wo.number = true
vim.g.shiftround = true
vim.g.ruler = true


--cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

