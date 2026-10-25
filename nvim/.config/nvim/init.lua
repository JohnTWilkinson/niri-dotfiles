vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("config.lazy")
require("config.options")
require("config.keybinds")
require('mini.icons').setup()
require('lualine').setup({
	options = {
		theme = 'jellybeans',
	},
})
require('mini.move').setup({
  mappings = {
    left = '<S-left>', right = '<S-right>', down = '<S-down>', up = '<S-up>',
    line_left = '<S-left>', line_right = '<S-right>',
    line_down = '<S-down>', line_up = '<S-up>',
  },
})

vim.opt.clipboard = "unnamedplus"
-- vim.opt.runtimepath:prepend(vim.fn.stdpath('data') .. '/site')
-- vim.cmd.colorscheme("catppuccin-mocha")
vim.cmd.colorscheme("kanagawa-dragon")





