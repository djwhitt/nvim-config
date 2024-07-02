  return {
    'hrsh7th/nvim-cmp',
    opts = function(_, opts)
      local cmp = require('cmp')

      -- Avoid interfering with GitHub Copilot
      opts.mapping['<Tab>'] = cmp.config.disable
      opts.mapping['<S-Tab>'] = cmp.config.disable

      return opts
    end,
  }
