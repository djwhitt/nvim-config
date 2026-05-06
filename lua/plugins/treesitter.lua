---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "clojure",
      "eex",
      "elixir",
      "heex",
      "just",
      "lua",
      "vim",
    },
  },
}
