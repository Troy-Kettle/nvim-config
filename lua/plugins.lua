return require('packer').startup(function(use)
    -- Plug ins 
    use 'wbthomason/packer.nvim'
    use 'github/copilot.vim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    -- colorscheme
    use 'craftzdog/solarized-osaka.nvim' -- Solarized Osaka colorscheme
    
end)
