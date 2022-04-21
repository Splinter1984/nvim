local M = {}

function M.setup()
    -- Indicate first time installation
    local packer_bootstrap = false
  
    -- packer.nvim configuration
    local conf = {
      profile = {
        enable = true,
        threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
      },
  
      display = {
        open_fn = function()
          return require("packer.util").float { border = "rounded" }
        end,
      },
    }
  
    -- Check if packer.nvim is installed
    -- Run PackerCompile if there are changes in this file
    local function packer_init()
      local fn = vim.fn
      local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
      if fn.empty(fn.glob(install_path)) > 0 then
        packer_bootstrap = fn.system {
          "git",
          "clone",
          "--depth",
          "1",
          "https://github.com/wbthomason/packer.nvim",
          install_path,
        }
        vim.cmd [[packadd packer.nvim]]
      end
      vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
    end
  
    local function plugins(use)
        use 'wbthomason/packer.nvim'
        -- Better icons
        use {
            "kyazdani42/nvim-web-devicons",
            module = "nvim-web-devicons",
            config = function()
                require("nvim-web-devicons").setup { default = true }
            end,
        }

         -- IndentLine
        use {
            "lukas-reineke/indent-blankline.nvim",
            event = "BufReadPre",
            config = function()
                require("config.indentblankline").setup()
            end,
        }

        -- Colorscheme
        use {
            'morhetz/gruvbox',
            config = function()
                require 'config.gruvbox'.setup()
                vim.cmd 'colorscheme gruvbox'
            end,
        }

        -- WhichKey
         use {
            "folke/which-key.nvim",
            event = "VimEnter",
            config = function()
                require("config.whichkey").setup()
            end,
        }

        -- Bootstrap Neovim
        if packer_bootstrap then
            print "Restart Neovim required after installation!"
            require("packer").sync()
        end   
    end

    packer_init()

    local packer = require "packer"
    packer.init(conf)
    packer.startup(plugins)
end

return M
