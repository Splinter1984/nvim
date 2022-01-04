local cmd = vim.cmd
local indent = 2

cmd 'syntax enable'
cmd 'filetype plugin indent on'
cmd 'set guifont=Hack\\ Nerd\\ Font\\ Mono:h9'
cmd 'language en_US.utf-8'
cmd 'set mouse=a'

vim.g.visualbell = true
vim.bo.autoread = true
vim.g.backspace = '2'

vim.wo.cursorline = true

vim.g.wildmenu = true
vim.g.expandtab = true
vim.g.shiftwidth = indent
vim.g.foldcolumn = '1'
vim.g.noerrorbells = true
vim.g.smartcase = true
vim.g.smartindent = true
vim.g.tabstop = indent
vim.o.ignorecase = true
vim.wo.number = true
vim.g.shiftround = true
vim.g.ruler = true


--cmd 'au TextYankPost * lua vim.highlight.on_yank {on_visual = false}'

