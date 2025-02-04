return require('packer').startup(function(use)
    -- Plugin manager
    use 'wbthomason/packer.nvim'

    -- Plugins
    use 'github/copilot.vim'
    use 'tpope/vim-commentary'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }

    -- TreeSitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup {
                -- A list of parser names, or "all"
                ensure_installed = {
                    "lua",
                    "vim",
                    "python",
                    "javascript",
                    "typescript",
                    "json",
                    "html",
                    "css",
                },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                auto_install = true,

                highlight = {
                    -- `false` will disable the whole extension
                    enable = true,

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    additional_vim_regex_highlighting = false,
                },

                indent = { enable = true },

                -- Optional: Enable incremental selection
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
        end
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
