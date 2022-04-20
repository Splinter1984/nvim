local opt = vim.opt
local cmd = vim.cmd

vim.g.mapleader = ''
cmd 'syntax enable'
opt.encoding = 'utf-8'
opt.fileencoding = 'utf-8'

opt.shortmess = 'I'
opt.visualbell = true
opt.autoread = true
opt.backspace = '2'
opt.tabstop = 4
opt.shiftwidth = 4
opt.mouse = 'a'
opt.colorcolumn = '80'
opt.numberwidth = 4

opt.cursorline = true
opt.hlsearch = true
opt.lazyredraw = true
opt.magic = true
opt.showmatch = true
opt.autoread = true
opt.wildmenu = true
opt.expandtab = true
opt.foldcolumn = '1'
opt.smartcase = true
opt.smartindent = true
opt.ignorecase = true
opt.number = true
opt.shiftround = true
opt.ruler = true
--[[
local backup_dir = fn.stdpath("cache") .. "/backup"
local backup_stat = pcall(os.execute, "mkdir -p " .. backup_dir)
if backup_stat then
  opt.backupdir = backup_dir
  opt.directory = backup_dir
end

local undo_dir = fn.stdpath("cache") .. "/undo"
local undo_stat = pcall(os.execute, "mkdir -p " .. undo_dir)
local has_persist = fn.has("persistent_undo")
if undo_stat and has_persist == 1 then
  opt.undofile = true
  opt.undodir = undo_dir
end
]]--
