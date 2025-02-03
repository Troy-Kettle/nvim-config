-- Set leader key to space FIRST
vim.g.mapleader = " "

-- Then set other options
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Show relative line numbers
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.tabstop = 4                  -- Number of spaces tabs count for
vim.opt.shiftwidth = 4               -- Size of an indent
vim.opt.smartindent = true           -- Insert indents automatically
vim.opt.wrap = false                 -- Don't wrap lines
vim.opt.ignorecase = true            -- Ignore case in search
vim.opt.smartcase = true             -- But don't ignore it when search string contains uppercase
vim.opt.termguicolors = true         -- True color support
vim.opt.background = "dark"          -- Dark background

-- Load plugins
require('plugins')

-- Colorscheme setup
local status, _ = pcall(vim.cmd, "colorscheme solarized-osaka")
if not status then
    print("Colorscheme not found!")
end

-- Telescope keymaps LAST (after plugins are loaded)
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

