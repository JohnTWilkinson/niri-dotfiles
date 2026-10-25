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


-- resizing splits, these accept a count, so `10<A-h>` resizes by 10 * config.resize.amount
-- vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
-- vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
-- vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
-- vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
-- moving between splits
-- vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
-- vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
-- vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
-- vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
-- -- swapping buffers between windows
-- vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
-- vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
-- vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
-- vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
