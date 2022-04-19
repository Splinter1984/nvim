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
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'nvim-telescope/telescope.nvim',
        requires= 'nvim-lua/plenary.nvim',	
    }
    use 'morhetz/gruvbox'
    use 'nvim-lualine/lualine.nvim'
    use {
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp",
            'quangnguyen30192/cmp-nvim-ultisnips', 'hrsh7th/cmp-nvim-lua',
            'octaltree/cmp-look', 'hrsh7th/cmp-path', 'hrsh7th/cmp-calc',
            'f3fora/cmp-spell', 'hrsh7th/cmp-emoji'
        }
    }
    use {
        'neovim/nvim-lspconfig',
        'williamboman/nvim-lsp-installer',
    }
    use 'L3MON4D3/LuaSnip'
    use 'simrat39/rust-tools.nvim'
    use 'kdheepak/lazygit.nvim'
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
    }
    use {
        'tanvirtin/vgit.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    
    if PACKERD_BOOTSTRAP then
	    require("packer").sync()
    end
end)

