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
map('n', '<A-h>', req('smart-splits', 'move_cursor_left'))
map('n', '<A-l>', req('smart-splits', 'move_cursor_right'))
map('n', '<A-k>', req('smart-splits', 'move_cursor_up'))
map('n', '<A-j>', req('smart-splits', 'move_cursor_down'))

-- Moving
map('n', '<C-h>', req('smart-splits', 'swap_buf_left'))
map('n', '<C-l>', req('smart-splits', 'swap_buf_right'))
map('n', '<C-k>', req('smart-splits', 'swap_buf_up'))
map('n', '<C-j>', req('smart-splits', 'swap_buf_down'))

-- Resizing
map('n', '<A-S-h>', req('smart-splits', 'resize_left'))
map('n', '<A-S-l>', req('smart-splits', 'resize_right'))
map('n', '<A-S-k>', req('smart-splits', 'resize_up'))
map('n', '<A-S-j>', req('smart-splits', 'resize_down'))
