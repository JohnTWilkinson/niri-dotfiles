   return {
       'nvim-treesitter/nvim-treesitter',
       branch = 'main',
       lazy = false,
       build = ':TSUpdate',
       config = function()
           require('nvim-treesitter').install({
               'lua', 'python', 'rust', 'c', 'cpp',
               'markdown', 'markdown_inline', 'html', 'yaml',
           })

           vim.api.nvim_create_autocmd('FileType', {
               pattern = { 'lua', 'python', 'rust', 'c', 'cpp', 'markdown' },
               callback = function() pcall(vim.treesitter.start) end,
           })
       end,
   }
