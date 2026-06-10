-- In AstroNvim v6 nvim-treesitter is on its `main` branch (a parser-download
-- utility only). Parser installation and highlighting are now configured
-- through AstroCore's `treesitter` module instead of nvim-treesitter `opts`.
---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@param opts AstroCoreOpts
  opts = function(_, opts)
    opts.treesitter = opts.treesitter or {}
    opts.treesitter.ensure_installed = require("astrocore").list_insert_unique(
      opts.treesitter.ensure_installed,
      {
        "clojure",
        "eex",
        "elixir",
        "heex",
        "just",
        "lua",
        "vim",
      }
    )
  end,
}
