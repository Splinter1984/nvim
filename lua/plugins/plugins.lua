-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path}
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
  print(packer)
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
  -- use { "akinsho/bufferline.nvim" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "lukas-reineke/indent-blankline.nvim"}

    -- [[ Colorscheme ]] --
  -- TODO: create PR in original repo.
  use { "Splinter1984/gruvbox.nvim", branch = "inverse_debug" }
  --use { "~/forks/gruvbox.nvim" }
    -- "some interesting colorthemes"
  use { "catppuccin/nvim", as = "catppuccin" }

    -- [[ Treesitter ]] --
  use { "nvim-treesitter/nvim-treesitter"}

    -- [[ Gitsigns]] --
  use { "lewis6991/gitsigns.nvim"}

    -- [[ Fzf-lua ]] --
  use { "ibhagwan/fzf-lua" }

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
  -- [[use { "jose-elias-alvarez/null-ls.nvim" }]]--

    -- [[ Todo comments ]] --
  use { "folke/todo-comments.nvim" }

    -- [[ Fugitive ]] --
  use { "tpope/vim-fugitive" }

    -- [[ jinja2 ]] --
  use { "HiPhish/jinja.vim" }

  use { "mmarchini/bpftrace.vim" }
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
