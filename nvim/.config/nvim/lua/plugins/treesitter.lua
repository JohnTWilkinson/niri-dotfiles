return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter').setup({
            ensure_installed = { "lua", "python", "rust", "c", "cpp" },
            auto_install = true,
        })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = { "lua", "python", "rust", "c", "cpp" },
            callback = function()
                vim.treesitter.start()
            end,
        })
    end,
}
