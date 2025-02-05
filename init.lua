
-- Set leader key FIRST!
vim.g.mapleader = " "

-- General Options
vim.opt.number = true                -- Show line numbers
vim.opt.relativenumber = true        -- Relative line numbers
vim.opt.expandtab = true             -- Use spaces instead of tabs
vim.opt.tabstop = 4                  -- Spaces per tab
vim.opt.shiftwidth = 4               -- Indent size
vim.opt.smartindent = true           -- Auto-indent new lines
vim.opt.wrap = false                 -- Disable line wrap
vim.opt.ignorecase = true            -- Case-insensitive search...
vim.opt.smartcase = true             -- ...unless uppercase is used
vim.opt.termguicolors = true         -- True color support
vim.opt.background = "dark"          -- Dark background

-- Load Plugins (this file loads lua/plugins.lua)
require("plugins")

-- Setup Catppuccin Colorscheme
require("catppuccin").setup({
    flavour = "mocha",               -- Options: "mocha", "macchiato", "frappe", "latte"
    transparent_background = false,
    term_colors = true,
    integrations = {
        lualine = true,
        telescope = true,
        treesitter = true,
        which_key = true,
        indent_blankline = true,
        -- Add more integrations if needed
    },
})
vim.cmd("colorscheme catppuccin")

-- Telescope Keymaps
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>",  { desc = "Live Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>",    { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>",  { desc = "Help Tags" })

-- LSP Configuration (Example for Python using pyright)
local lspconfig = require("lspconfig")
lspconfig.pyright.setup {}

-- UI Enhancements

-- Statusline: lualine configured to use the Catppuccin theme
require("lualine").setup {
    options = {
        theme = "catppuccin",
        section_separators = "",
        component_separators = "│",
    },
}

-- Which-key: Displays available keybindings in a popup
require("which-key").setup {}

-- Indent Guides: Show vertical lines for indentation
vim.opt.list = true
vim.opt.listchars:append "space:⋅"   -- Optionally display spaces as dots
require("indent_blankline").setup {
    char = "│",
    show_trailing_blankline_indent = false,
}

