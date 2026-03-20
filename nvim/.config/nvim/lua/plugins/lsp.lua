return {
	{
		"neovim/nvim-lspconfig"
	},
	{
		"mason-org/mason.nvim"
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"rust_analyzer",
				"lua_ls",
				"ruff",
			}
		},
		dependencies = {
        		{ "mason-org/mason.nvim", opts = {} },
        		"neovim/nvim-lspconfig",
    		},
	},

}
