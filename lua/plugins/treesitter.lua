---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "clojure",
      "just",
      "lua",
      "vim",
    },
  },
}
