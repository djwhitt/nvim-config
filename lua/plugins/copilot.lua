return {
  "zbirenbaum/copilot.lua",
  requires = {
    "copilotlsp-nvim/copilot-lsp", -- (optional) for NES functionality
  },
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup({
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        clojure = true,
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
