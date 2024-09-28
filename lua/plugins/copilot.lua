return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        ["*"] = false,
        clojure = true,
        javascipt = true,
        lua = true,
        typescript = true,
      },
    }
  end,
}
