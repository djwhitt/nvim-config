return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  event = "InsertEnter",
  config = function()
    require("copilot").setup {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        clojure = true,
        javascipt = true,
        lua = true,
        make = true,
        nix = true;
        sh = true,
        sql = true,
        typescript = true,

        ["*"] = false,
      },
    }
  end,
}
