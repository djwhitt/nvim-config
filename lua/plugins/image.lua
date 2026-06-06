return {
  {
    "3rd/image.nvim",
    cond = not vim.g.neovide, -- Neovide lacks terminal graphics protocols (kitty/ueberzug)
    build = false, -- so that it doesn't build the rock https://github.com/3rd/image.nvim/issues/91#issuecomment-2453430239
    opts = {},
  },
}
