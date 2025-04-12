-- Space before any mappings
vim.g.mapleader = " "

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

-- Bootstrap packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Force-load packer.nvim
vim.cmd [[packadd packer.nvim]]

-- Load Plugins (from lua/plugins.lua)
require('plugins')

-- Configure Catppuccin
local catppuccin_status, catppuccin = pcall(require, 'catppuccin')
if catppuccin_status then
    catppuccin.setup({
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        term_colors = true,
        transparent_background = false,
        no_italic = false,
        no_bold = false,
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = { "bold" },
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
        },
        integrations = {
            cmp = true,
            telescope = true,
            which_key = true,
        },
    })

    -- Try to load catppuccin
    local colorscheme_status, _ = pcall(vim.cmd, "colorscheme catppuccin")
    if not colorscheme_status then
        print("Failed to load catppuccin colorscheme")
        vim.cmd("colorscheme desert")
    end
else
    print("Catppuccin plugin not found. Make sure it's installed correctly.")
    vim.cmd("colorscheme desert")
end

-- Setup lualine (Statusline)
local lualine_status, lualine = pcall(require, "lualine")
if lualine_status then
    lualine.setup {
        options = {
            theme = "catppuccin",
            section_separators = "",
            component_separators = "|",
        },
    }
end

-- Directly set up Python LSP (without using newer plugins)
local lsp_status, lspconfig = pcall(require, "lspconfig")
if lsp_status then
    -- Setup Python LSP (pyright)
    lspconfig.pyright.setup {
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
local telescope_status, _ = pcall(require, "telescope")
if telescope_status then
    vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { noremap = true, silent = true })
    vim.api.nvim_set_keymap("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { noremap = true, silent = true })
end

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

-- Run :PackerSync if we just bootstrapped packer
if packer_bootstrap then
    require('packer').sync()
end
