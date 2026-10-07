require("config.lazy")
require("config.options")
require('mini.icons').setup()
require('lualine').setup({
	options = {
		theme = 'jellybeans',
	},
})

vim.g.mapleader = ' '
vim.opt.clipboard = "unnamedplus"
vim.opt.runtimepath:prepend(vim.fn.stdpath('data') .. '/site')
-- vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd.colorscheme("kanagawa-dragon")





