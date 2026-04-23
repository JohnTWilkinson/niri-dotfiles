require("config.lazy")
require("config.options")

vim.g.mapleader = ' '
vim.opt.clipboard = "unnamedplus"
vim.opt.runtimepath:prepend(vim.fn.stdpath('data') .. '/site')
vim.cmd.colorscheme("catppuccin-mocha")





