-- Helper function to make sure that lazy doesn't load the plugin unnecessarily just
-- when registering a keymap. Returns a function that calls require for me.
local function req(mod, fn, ...)
	local args = { ... }
	return function ()
		return require(mod)[fn](unpack(args))
	end
end

-- I ain't writing all'at

local map = vim.keymap.set



-------------------------------------------------------
-------------------------------------------------------
-- KEYBINDSSSSSSS
-------------------------------------------------------
-------------------------------------------------------


-- Please for the love of god stop highlighting my searches
map('n', '<Esc>', '<cmd>nohlsearch<CR>')


-------------------------------------------------------
-- PANE/TABS
-------------------------------------------------------
--- Navigation
map('n', '<A-left>', req('smart-splits', 'move_cursor_left'))
map('n', '<A-right>', req('smart-splits', 'move_cursor_right'))
map('n', '<A-up>', req('smart-splits', 'move_cursor_up'))
map('n', '<A-down>', req('smart-splits', 'move_cursor_down'))

-- Moving
map('n', '<A-C-left>', req('smart-splits', 'swap_buf_left'))
map('n', '<A-C-right>', req('smart-splits', 'swap_buf_right'))
map('n', '<A-C-up>', req('smart-splits', 'swap_buf_up'))
map('n', '<A-C-down>', req('smart-splits', 'swap_buf_down'))

-- Resizing
map('n', '<A-S-left>', req('smart-splits', 'resize_left'))
map('n', '<A-S-right>', req('smart-splits', 'resize_right'))
map('n', '<A-S-up>', req('smart-splits', 'resize_up'))
map('n', '<A-S-down>', req('smart-splits', 'resize_down'))



-------------------------------------------------------
-- Moving Lines
-------------------------------------------------------
-- Normal
map('n', '<A-C-h>', req('mini.move','move_line', 'left'))
map('n', '<A-C-l>', req('mini.move','move_line', 'right'))
map('n', '<A-C-k>', req('mini.move','move_line', 'up'))
map('n', '<A-C-j>', req('mini.move','move_line', 'down'))

-- Visual 
map('v', '<A-C-h>', req('mini.move','move_selection', 'left'))
map('v', '<A-C-l>', req('mini.move','move_selection', 'right'))
map('v', '<A-C-k>', req('mini.move','move_selection', 'up'))
map('v', '<A-C-j>', req('mini.move','move_selection', 'down'))
