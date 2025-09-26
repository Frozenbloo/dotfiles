vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.swapfile = false
vim.g.mapleader = " "

vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

require("frozenbloo.plugins-setup") 
require("frozenbloo.core.options")
require("frozenbloo.core.keymaps")
require("frozenbloo.core.colorscheme")
require("frozenbloo.plugins.comment")
require("frozenbloo.plugins.nvim-tree")
require("frozenbloo.plugins.lualine")
require("frozenbloo.plugins.telescope")
require("frozenbloo.plugins.nvim-cmp")
require("frozenbloo.plugins.lsp.mason")
require("frozenbloo.plugins.lsp.lspsaga")
require("frozenbloo.plugins.lsp.lspconfig")
require("frozenbloo.plugins.lsp.null-ls")
require("frozenbloo.plugins.autopairs")
require("frozenbloo.plugins.treesitter")
require("frozenbloo.plugins.gitsigns")
