local opt = vim.opt

opt.tabstop = 4
opt.shiftwidth = 4
vim.opt.expandtab = false

opt.number = true
opt.relativenumber = true
opt.numberwidth = 2

opt.termguicolors = true
opt.signcolumn = "yes:1"

opt.scrolloff = 8

opt.swapfile = false
opt.undofile = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
