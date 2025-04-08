-- Set the leader key to space before any mappings
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

-- Try to load Rose Pine; if not available, fallback to desert
local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
if not status then
    vim.cmd("colorscheme desert")
end

-- Setup lualine (Statusline)
if pcall(require, "lualine") then
    require("lualine").setup {
        options = {
            theme = "auto",
            section_separators = "",
            component_separators = "|",
        },
    }
end

-- Telescope Keymaps (Fuzzy Finder)
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>",    { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",  { desc = "Help Tags" })

-- LSP Configuration (Example: Pyright for Python)
local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if lspconfig_status then
    lspconfig.pyright.setup {}
end

-- init.lua
vim.keymap.set("i", "<CapsLock>", "<Esc>")  -- in insert mode, caps lock = escape


