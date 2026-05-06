return {
  "zbirenbaum/copilot.lua",
  dependencies = {
    "copilotlsp-nvim/copilot-lsp", -- required for sidekick.nvim NES (Next Edit Suggestions)
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        clojure = true,
        elixir = true,
        javascript = true,
        lua = true,
        make = true,
        nix = true,
        sh = true,
        sql = true,
        typescript = true,

        ["*"] = false,
      },
    })
  end,
}
