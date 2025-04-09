-- Space before any mappings
vim.g.mapleader = " "
-- Force-load packer.nvim (this should be the very first line for plugins)
vim.cmd [[packadd packer.nvim]]
-- Basic Editor Settings
vim.opt.number = true               -- Enable line numbers
vim.opt.relativenumber = true       -- Relative line numbers
vim.opt.expandtab = true            -- Use spaces instead of tabs
vim.opt.shiftwidth = 4              -- Indent size
vim.opt.tabstop = 4                 -- Tab width
vim.opt.smartindent = true          -- Smart autoindenting
vim.opt.wrap = false                -- Disable line wrap
vim.opt.termguicolors = true        -- Enable true colors
vim.opt.background = "dark"         -- Set dark background
vim.g.netrw_list_hide = '.*\\.swp$'  -- Hide swap files in netrw
-- Load Plugins (from lua/plugins.lua)
require('plugins')

-- Configure rose-pine
require('rose-pine').setup({
    dark_variant = 'main',
    bold_vert_split = false,
    dim_nc_background = false,
    disable_background = false,
    disable_float_background = false,
    disable_italics = false,
    highlight_groups = {
        Comment = { italic = true },
        Keyword = { italic = true },
        Statement = { bold = true },
    },
})

-- Try to load rose-pine; if not available, fallback to desert
local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not status then
    vim.cmd("colorscheme desert")
end

-- Setup lualine (Statusline)
if pcall(require, "lualine") then
    require("lualine").setup {
        options = {
            theme = "rose-pine",
            section_separators = "",
            component_separators = "|",
        },
    }
end

-- Directly set up Python LSP (without using newer plugins)
local lsp_status, _ = pcall(require, "lspconfig")
if lsp_status then
    -- Setup Python LSP (pyright)
    require('lspconfig').pyright.setup {
        on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            -- Mappings
            local opts = { noremap = true, silent = true }
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
            vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        end,
        settings = {
            python = {
                analysis = {
                    autoSearchPaths = true,
                    diagnosticMode = "workspace",
                    useLibraryCodeForTypes = true
                }
            }
        }
    }
end

-- Basic nvim-cmp setup (if available)
local cmp_status, cmp = pcall(require, "cmp")
if cmp_status then
    cmp.setup({
        mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
            ['<Tab>'] = cmp.mapping.select_next_item(),
            ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
        }
    })
end

-- Telescope Keymaps (Fuzzy Finder)
vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })

-- CapsLock to Escape in insert mode (Note: This may not work in all terminals)
vim.api.nvim_set_keymap("i", "<CapsLock>", "<Esc>", { noremap = true })

-- Set up which-key if available
local whichkey_status, whichkey = pcall(require, "which-key")
if whichkey_status then
    whichkey.setup {}
end

-- Setup nvim-autopairs if available
local autopairs_status, autopairs = pcall(require, "nvim-autopairs")
if autopairs_status then
    autopairs.setup {}
end
