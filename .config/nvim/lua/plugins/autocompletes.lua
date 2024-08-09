return{
  -- nvim-cmp setup
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      -- Other sources can be added here
    },
    config = function()
      local cmp = require('cmp')

      cmp.setup({
        -- Add more configuration for nvim-cmp here if needed
      })

      -- Setup cmdline completion
      cmp.setup.cmdline(':', {
        sources = {
          { name = 'cmdline' },
          { name = 'path' }
        }
      })
    end,
  },
}
