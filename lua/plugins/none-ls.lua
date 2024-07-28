-- Customize None-ls sources

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
      -- Set a formatter
      -- TODO enable prettier and eslint with restrictions
      --null_ls.builtins.formatting.eslint,
      --null_ls.builtins.formatting.prettier,
      null_ls.builtins.diagnostics.selene,
      null_ls.builtins.formatting.nixfmt,
      null_ls.builtins.formatting.stylua,
    }
    return config -- return final config table
  end,
}
