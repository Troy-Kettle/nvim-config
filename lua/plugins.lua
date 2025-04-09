
return require('packer').startup(function(use)
    -- Let packer manage itself
    use "wbthomason/packer.nvim"

    -- Colorscheme: Catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }
    
    use 'rose-pine/neovim'

    -- Inside your plugins.lua file, add:
    use 'rebelot/kanagawa.nvim'

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
    }    -- Treesitter: Enhanced syntax highlighting and code parsing

    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    }

    -- LSP Configurations
    use "neovim/nvim-lspconfig"

    -- Autopairs: Automatically insert matching brackets, quotes, etc.
    use "windwp/nvim-autopairs"

    -- GitHub Copilot
    use "github/copilot.vim"

    -- Commentary: Easy commenting
    use "tpope/vim-commentary"

end)

