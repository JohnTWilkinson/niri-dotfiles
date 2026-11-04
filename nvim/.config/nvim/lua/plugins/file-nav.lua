---@type LazySpec
return {
	{
	  "mikavilpas/yazi.nvim",
	  version = "*", -- use the latest stable version
	  event = "VeryLazy",
	  dependencies = {
	    { "nvim-lua/plenary.nvim", lazy = true },
	  },
	  keys = {
	    -- 👇 in this section, choose your own keymappings!
	    {
	      "<leader>y",
	      mode = { "n", "v" },
	      "<cmd>Yazi<cr>",
	      desc = "Open yazi at the current file",
	    },
	    {
	      -- Open in the current working directory
	      "<leader>cw",
	      "<cmd>Yazi cwd<cr>",
	      desc = "Open the file manager in nvim's working directory",
	    },
	    {
	      "<leader>Y",
	      "<cmd>Yazi toggle<cr>",
	      desc = "Resume the last yazi session",
	    },
	  },
	  ---@type YaziConfig | {}
	  opts = {
	    -- if you want to open yazi instead of netrw, see below for more info
	    open_for_directories = false,
	    keymaps = {
	      show_help = "<f1>",
	    },
	  },
	  -- 👇 if you use `open_for_directories=true`, this is recommended
	  init = function()
	    -- mark netrw as loaded so it's not loaded at all.
	    --
	    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
	    vim.g.loaded_netrwPlugin = 1
	  end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		opts = {},
	},
	{
	  'stevearc/oil.nvim',
	  ---@module 'oil'
	  ---@type oil.SetupOpts
	  opts = {},
	  -- Optional dependencies
	  -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
	  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
	  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
	  lazy = false,
	}
}
