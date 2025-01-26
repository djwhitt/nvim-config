return {
  "vimwiki/vimwiki",
  lazy = false,
  init = function()
    vim.g["vimwiki_list"] = { { path = "~/Vimwiki/" } }
  end,
}
