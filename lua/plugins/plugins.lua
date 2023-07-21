-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = vim.fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim",
                                  install_path}
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float {
                border = "rounded"
            }
        end
    }
}

return packer.startup(function(use)
    -- [[ Common ]] --
    use { "wbthomason/packer.nvim" }
    use { "nvim-lua/plenary.nvim" }
    use { "windwp/nvim-autopairs" }
    use { "nvim-lualine/lualine.nvim" }
    use { "akinsho/bufferline.nvim" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "lukas-reineke/indent-blankline.nvim" }

    -- [[ Colorscheme ]] --
    use { "Splinter1984/gruvbox" }
    -- "some interesting colorthemes"
    use { 'widatama/vim-phoenix' }
    use { 'kadekillary/skull-vim' }
    use { 'huyvohcmc/atlas.vim' }

    -- [[ Treesitter ]] -- 
    use { "nvim-treesitter/nvim-treesitter" }

    -- [[ Gitsigns]] --
    use { "lewis6991/gitsigns.nvim" }

    -- [[ NeoGit ]] --
    -- TODO: replace by `main` on stable version.
    use { 'NeogitOrg/neogit', commit="36ffabb09974d3cdc3f3b31a639280da36a2b79f" }

    -- [[ Fzf-lua ]] --
    -- TODO: replace by `main` on stable version.
    use { "ibhagwan/fzf-lua", commit="04d5a528a4159901607c11d46a398f45db2ed43f" }

    -- [[ Cmp ]]
    use { "hrsh7th/nvim-cmp" }
    use { "hrsh7th/cmp-buffer" }
    use { "hrsh7th/cmp-path" }
    use { "saadparwaiz1/cmp_luasnip" }
    use { "hrsh7th/cmp-nvim-lsp" }
    use { "hrsh7th/cmp-nvim-lua" }
    use { "L3MON4D3/LuaSnip" }

    -- [[ Lsp ]] --
    use { "neovim/nvim-lspconfig" }
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }
    use { "jose-elias-alvarez/null-ls.nvim" }
    --use { "folke/lsp-colors.nvim"}
    --use { "RRethy/vim-illuminate" } 

    -- [[ Todo comments ]] --
    use { "folke/todo-comments.nvim" }

    -- [[ Glance ]] --
    use { 'dnlhc/glance.nvim' }

    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
