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

        -- Lualine
        use {
            'nvim-lualine/lualine.nvim',
            event = "VimEnter",
            config = function()
                require 'config.lualine'.setup()
            end,
            requires = {
                'nvim-web-devicons'
            },
        }

        -- Treesitter
        use {
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate",
            config = function()
                require("config.treesitter").setup()
            end,
        }

        --  NvimGps
        use {
            "SmiteshP/nvim-gps",
            module = "nvim-gps",
            config = function()
                require 'nvim-gps'.setup()
            end,
            requires = {
                "nvim-treesitter/nvim-treesitter"
            },
        }

        -- FZF Lua
        use {
            "ibhagwan/fzf-lua",
            event = "BufEnter",
            requires = { "kyazdani42/nvim-web-devicons" },
        }

        -- nvim-tree
        use {
            "kyazdani42/nvim-tree.lua",
            requires = {
                "kyazdani42/nvim-web-devicons",
            },
            cmd = { "NvimTreeToggle", "NvimTreeClose" },
            config = function()
                require("config.nvimtree").setup()
            end,
        }

        -- Buffer line
        use {
            "akinsho/nvim-bufferline.lua",
            event = "BufReadPre",
            wants = "nvim-web-devicons",
            config = function()
                require("config.bufferline").setup()
            end,
        }

        -- User interface
        use {
            "stevearc/dressing.nvim",
            event = "BufEnter",
            config = function()
                require("dressing").setup {
                    select = {
                        backend = { "telescope", "fzf", "builtin" },
                    },
                }
            end,
        }
        use { "nvim-telescope/telescope.nvim", module = "telescope", as = "telescope" }

        -- Lightspeed
        use {
            "ggandor/lightspeed.nvim",
            keys = { "s", "S", "f", "F", "t", "T" },
            config = function()
                require("lightspeed").setup {}
            end,
        }

        -- Completion
        use {
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            opt = true,
            config = function()
                require("config.cmp").setup()
            end,
            wants = { "LuaSnip" },
            requires = {
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "ray-x/cmp-treesitter",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-nvim-lsp-signature-help",
                "hrsh7th/cmp-calc",
                "f3fora/cmp-spell",
                "hrsh7th/cmp-emoji",
                {
                    "L3MON4D3/LuaSnip",
                    wants = "friendly-snippets",
                    config = function()
                        require("config.luasnip").setup()
                    end,
                },
                "rafamadriz/friendly-snippets",
                disable = false,
            },
        }

        -- LSP
        use {
            "neovim/nvim-lspconfig",
            opt = true,
            event = "BufReadPre",
            wants = { 'nvim-lsp-installer', 'lsp_signature.nvim', 'cmp-nvim-lsp' },
            config = function()
                require 'config.lsp'.setup()
            end,
            requires = {
                'williamboman/nvim-lsp-installer',
                'ray-x/lsp_signature.nvim',
            },
        }
        
        -- Modes
        use {
            "mvllow/modes.nvim",
            config = function()
                require 'modes'.setup() 
            end
        }

        -- VGit
        use {
            'tanvirtin/vgit.nvim',
            config = function()
                require 'config.vgit'.setup()
            end,
            requires = {
                'nvim-lua/plenary.nvim',
            },
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
