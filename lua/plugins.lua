local cmd = vim.cmd
cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use 'wbthomason/packer.nvim'
    use 'junegunn/fzf.vim'
    use 'liuchengxu/vim-clap'
    use 'glepnir/dashboard-nvim'
    use 'kyazdani42/nvim-web-devicons'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require'nvim-tree'.setup {} end
    }
    use 'nvim-lua/plenary.nvim'
    use 'voldikss/vim-floaterm'
    use 'nvim-telescope/telescope.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/completion-nvim'
    use 'tjdevries/nlua.nvim'
    use 'morhetz/gruvbox'
    use 'nvim-lualine/lualine.nvim'

end)