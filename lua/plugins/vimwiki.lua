return {
  "vimwiki/vimwiki",
  lazy = false,
  init = function()
    vim.g["vimwiki_global_ext"] = 0

    local me = { path = "~/Vimwiki/me/", syntax = "markdown", ext = "md" }
    local supa = { path = "~/Vimwiki/supa/", syntax = "markdown", ext = "md" }

    -- The work laptop (Supabase MacBook Pro) defaults to the local-only `supa`
    -- wiki; every other machine defaults to the personal `me` wiki. The first
    -- list entry is wiki #1, opened with <Leader>ww (others via <count><Leader>ww).
    local is_work_laptop = vim.fn.hostname():match "^Davids%-MacBook%-Pro" ~= nil

    if is_work_laptop then
      vim.g["vimwiki_list"] = { supa, me }
    else
      vim.g["vimwiki_list"] = { me }
    end
  end,
}
