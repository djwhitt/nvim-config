---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    -- config variable is the default configuration table for the setup function call
    local null_ls = require("null-ls")

    -- Check supported formatters and linters
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/formatting
    -- https://github.com/nvimtools/none-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
    config.sources = {
      -- Lua
      null_ls.builtins.diagnostics.selene, -- Lua diagnostics
      null_ls.builtins.formatting.stylua,

      -- JavaScript and TypeScript
      null_ls.builtins.formatting.prettier,

      -- Nix
      null_ls.builtins.formatting.nixfmt,
    }
    return config
  end,
}
