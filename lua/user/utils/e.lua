local M = {}

function M.send_under_cursor_to_e()
  -- Try filename under cursor first
  local s = vim.fn.expand('<cfile>')

  -- Fallback to word under cursor if <cfile> is empty
  if s == nil or s == '' then
    s = vim.fn.expand('<cword>')
  end

  if s == nil or s == '' then
    vim.notify('No word/file under cursor to send to e', vim.log.levels.WARN)
    return
  end

  -- Expand ~ etc.
  s = vim.fn.expand(s)

  -- Call your external script `e` asynchronously
  vim.fn.jobstart({ 'e', s }, { detach = true })
end

return M
