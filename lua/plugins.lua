
-- This file sets up your plugins using packer.nvim
return require("packer").startup(function(use)
    -- Plugin Manager
    use "wbthomason/packer.nvim"

    -- Colorscheme: Catppuccin
    use { "catppuccin/nvim", as = "catppuccin" }

    -- File icons (used by lualine, etc.)
    use "kyazdani42/nvim-web-devicons"

    -- Statusline: lualine
    use {
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    }

    -- Which-key: Keybinding helper
    use "folke/which-key.nvim"

    -- Indent guides: indent-blankline
    use "lukas-reineke/indent-blankline.nvim"

    -- GitHub Copilot
    use "github/copilot.vim"

    -- Commentary: Easy commenting
    use "tpope/vim-commentary"

    -- LSP Configurations
    use "neovim/nvim-lspconfig"

    -- Telescope: Fuzzy Finder
    use {
        "nvim-telescope/telescope.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    }

    -- Treesitter for better syntax highlighting and code understanding
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup {
                -- List of parsers to install
                ensure_installed = {
                    "lua", "vim", "python", "javascript", "typescript", "json", "html", "css"
                },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "gnn",
                        node_incremental = "grn",
                        scope_incremental = "grc",
                        node_decremental = "grm",
                    },
                },
            }
        end,
    }

    -- Auto pairs: Automatically insert matching brackets, quotes, etc.
    use {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup {}
        end,
    }
end)

