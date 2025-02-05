
-- Set leader key FIRST!
vim.g.mapleader = " "

-- General Options
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.tabstop = 4                  -- Spaces per tab
vim.opt.shiftwidth = 4               -- Indentation size
vim.opt.smartindent = true           -- Auto-indent new lines
vim.opt.wrap = false                 -- Disable line wrap
vim.opt.ignorecase = true            -- Case-insensitive search...
vim.opt.smartcase = true             -- ...unless uppercase is used
vim.opt.termguicolors = true         -- True color support
vim.opt.background = "dark"          -- Dark background

-- Load Plugins (from lua/plugins.lua)
require("plugins")

-- Catppuccin Colorscheme Setup (with lualine integration disabled)
require("catppuccin").setup({
    flavour = "mocha",               -- Options: "mocha", "macchiato", "frappe", "latte"
    transparent_background = false,
    term_colors = true,
    integrations = {
        lualine = false,             -- Disabled to prevent the error
        telescope = true,
        treesitter = true,
        which_key = true,
        indent_blankline = true,
    },
})
vim.cmd("colorscheme catppuccin")

-- Telescope Keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>",    { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",  { desc = "Help Tags" })

-- LSP Setup (example: Pyright for Python)
local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}

-- UI Enhancements

-- Statusline: lualine using its own configuration
require("lualine").setup {
    options = {
        theme = "catppuccin",  -- Using Catppuccin theme (if available) or choose another
        section_separators = "",
        component_separators = "│",
    },
}

-- Which-key for keybinding hints
require("which-key").setup {}

-- Indent Guides: indent-blankline configuration
vim.opt.list = true
vim.opt.listchars:append "space:⋅"  -- Optional: show spaces as dots
require("indent_blankline").setup {
    char = "│",
    show_trailing_blankline_indent = false,
}

