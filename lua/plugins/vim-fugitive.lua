return {
  "tpope/vim-fugitive",
  lazy = false,
  priority = 0, -- Load last to ensure keybinding works
  config = function()
    vim.keymap.set(
      "n",
      "<leader>gg",
      "<cmd>G<cr>",
      { desc = "Vim fugitive G", noremap = true, silent = true }
    )
  end,
}
