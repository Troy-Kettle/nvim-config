return require('packer').startup(function(use)
    -- Existing plugins
    use 'wbthomason/packer.nvim'
    use 'github/copilot.vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'tpope/vim-commentary'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use 'craftzdog/solarized-osaka.nvim' -- Solarized Osaka colorscheme
    
end)
