return require('packer').startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- Plugins
    use 'github/copilot.vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    
    -- Auto pairs
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

    -- Colorscheme
    use 'craftzdog/solarized-osaka.nvim' -- Solarized Osaka colorscheme
end)

