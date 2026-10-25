return {
  'smart-splits-nvim/smart-splits.nvim',
  version = '^3.0.0',
  -- backend (zellij)
  dependencies = {
    {
      'smart-splits-nvim/backend-zellij-lua',
      main = 'smart-splits-backend-zellij-lua',
      opts = {
        --[[ backend-specific options go here ]]
      },
    },
  },
  opts = {
    mux = { backend = 'smart-splits-backend-zellij-lua' },
  },
}
