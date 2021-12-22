local cmd = vim.cmd
local fn = vim.fn

--[[Auto install packer.nvim if not exists]]--
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system
	{
		"git",
		"clone",
		"--depth",
		"1",
 		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen neovim"
	cmd [[packadd packer.nvim]]
end

cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

packer.init 
{
	display = 
	{
		open_fn = function()
			return require("packer.util").float {border = "rounded"}
		end,
	},
}

return packer.startup(function(use)

    use 'wbthomason/packer.nvim'
    use 'junegunn/fzf.vim'
    use 'liuchengxu/vim-clap'
    use 'prabirshrestha/vim-lsp'
    use 'mattn/vim-lsp-settings'
    use 'prabirshrestha/asyncomplete.vim'
    use 'prabirshrestha/asyncomplete-lsp.vim'
    use 'glepnir/dashboard-nvim'
    use 'kyazdani42/nvim-web-devicons'
    use 'jacoborus/tender.vim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    } 
    use 'voldikss/vim-floaterm'
    use 'neovim/nvim-lspconfig'
    use 'nvim-treesitter/nvim-treesitter'
    use {
				'nvim-telescope/telescope.nvim',
				requires= 'nvim-lua/plenary.nvim',	
    }
    use 'nvim-lua/completion-nvim'
    use 'tjdevries/nlua.nvim'
    use 'morhetz/gruvbox'
    use 'nvim-lualine/lualine.nvim'

    if PACKERD_BOOTSTRAP then
	    require("packer").sync()
    end
end)

