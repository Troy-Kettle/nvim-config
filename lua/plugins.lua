return require('packer').startup(function(use)
    -- Let packer manage itself
    use "wbthomason/packer.nvim"
    
    -- Colorschemes
    use { "catppuccin/nvim", as = "catppuccin" }
    use 'rose-pine/neovim'  -- Without the 'as' parameter to match existing installation
    use "rebelot/kanagawa.nvim"
    
    -- Statusline: lualine (with icon support)
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" }
    }
    
    -- Which-key: Popup for key bindings
    use "folke/which-key.nvim"
    
    -- Telescope: Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    
    -- Treesitter: Enhanced syntax highlighting and code parsing
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }
    
    -- LSP Configuration (compatible with Neovim 0.9.5)
    use {
        "neovim/nvim-lspconfig",
        tag = "v0.1.3"  -- Use an older version compatible with Neovim 0.9.5
    }
    
    -- Basic autocompletion for Neovim 0.9
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    
    -- Autopairs: Automatically insert matching brackets, quotes, etc.
    use "windwp/nvim-autopairs"
    
    -- GitHub Copilot
    use "github/copilot.vim"
    
    -- Commentary: Easy commenting
    use "tpope/vim-commentary"
end)
